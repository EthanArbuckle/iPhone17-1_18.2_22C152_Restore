@interface GEOPDCategorizedPhotosFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCategorizedPhotosFilter)init;
- (GEOPDCategorizedPhotosFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_reservePhotoSizeFilters:(uint64_t)result;
- (unint64_t)hash;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setCategoryId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCategorizedPhotosFilter

- (void)dealloc
{
  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)&self->_flags |= 0x20u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(unsigned char *)&self->_flags |= 0x80u;
    self->_photoSizeFiltersSpace = 0;
    self->_photoSizeFiltersCount = 0;
    free(self->_photoSizeFilters);
    self->_photoSizeFilters = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDCategorizedPhotosFilter;
  [(GEOPDCategorizedPhotosFilter *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(unsigned char *)&self->_flags <= 0x1Fu)
    {
      v9 = self->_reader;
      objc_sync_enter(v9);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v10 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v10];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_19;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)self, 0);
  if (self->_photoSizeFiltersCount)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOPDPhotoSizeFilterValueWriteTo((uint64_t)&self->_photoSizeFilters[v6]);
      PBDataWriterRecallMark();
      ++v7;
      ++v6;
    }
    while (v7 < self->_photoSizeFiltersCount);
  }
  if (self->_categoryId) {
    PBDataWriterWriteStringField();
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_10:
      if ((flags & 8) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      PBDataWriterWriteBOOLField();
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt32Field();
  char flags = (char)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if ((flags & 4) != 0) {
LABEL_12:
  }
    PBDataWriterWriteBOOLField();
LABEL_13:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
LABEL_19:
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_1349;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_1350;
      }
      GEOPDCategorizedPhotosFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)hash
{
  -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBHashBytes();
  NSUInteger v4 = [(NSString *)self->_categoryId hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_startIndex;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_count;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_includeCoverPhoto;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v8 = 2654435761 * self->_coverPhotoFirst;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (GEOPDCategorizedPhotosFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategorizedPhotosFilter;
  v2 = [(GEOPDCategorizedPhotosFilter *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    NSUInteger v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDCategorizedPhotosFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategorizedPhotosFilter;
  uint64_t v3 = [(GEOPDCategorizedPhotosFilter *)&v7 initWithData:a3];
  NSUInteger v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (uint64_t)_reservePhotoSizeFilters:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    unint64_t v3 = *(void *)(result + 32);
    unint64_t v4 = v3 + a2;
    if (v3 + a2 <= v3) {
      return 0;
    }
    unint64_t v5 = *(void *)(result + 40);
    if (v5 >= v4) {
      return 1;
    }
    unint64_t v6 = v5 + a2;
    if (v5 + a2)
    {
      unint64_t v7 = 1;
      while (1)
      {
        unint64_t v8 = v7;
        if (v7 >= v6) {
          break;
        }
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          unint64_t v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (v8 < a2) {
      return 0;
    }
LABEL_11:
    if (12 * v8 < v8) {
      return 0;
    }
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 12 * v8, 0x3E8DE316uLL);
    if (result)
    {
      v2[5] = v8;
      v2[3] = result;
      bzero((void *)(result + 12 * v2[4]), 12 * (v8 - v2[4]));
      return 1;
    }
  }
  return result;
}

- (void)setCategoryId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 80) |= 0x40u;
    *(unsigned char *)(a1 + 80) |= 0x80u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCategorizedPhotosFilter;
  id v4 = [(GEOPDCategorizedPhotosFilter *)&v8 description];
  unint64_t v5 = [(GEOPDCategorizedPhotosFilter *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategorizedPhotosFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_30;
  }
  -[GEOPDCategorizedPhotosFilter readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(a1 + 32))
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        objc_super v8 = _GEOPDPhotoSizeFilterValueDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v6));
        [v5 addObject:v8];

        ++v7;
        v6 += 12;
      }
      while (v7 < *(void *)(a1 + 32));
    }
    if (a2) {
      v9 = @"photoSizeFilter";
    }
    else {
      v9 = @"photo_size_filter";
    }
    [v4 setObject:v5 forKey:v9];
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      id v11 = v10;
      objc_sync_enter(v11);
      GEOPDCategorizedPhotosFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryId_tags_1327);
      objc_sync_exit(v11);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  id v12 = *(id *)(a1 + 48);
  if (v12)
  {
    if (a2) {
      v13 = @"categoryId";
    }
    else {
      v13 = @"category_id";
    }
    [v4 setObject:v12 forKey:v13];
  }

  char v14 = *(unsigned char *)(a1 + 80);
  if ((v14 & 2) != 0)
  {
    v24 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
    if (a2) {
      v25 = @"startIndex";
    }
    else {
      v25 = @"start_index";
    }
    [v4 setObject:v24 forKey:v25];

    char v14 = *(unsigned char *)(a1 + 80);
    if ((v14 & 1) == 0)
    {
LABEL_20:
      if ((v14 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_38;
    }
  }
  else if ((*(unsigned char *)(a1 + 80) & 1) == 0)
  {
    goto LABEL_20;
  }
  v26 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 68)];
  [v4 setObject:v26 forKey:@"count"];

  char v14 = *(unsigned char *)(a1 + 80);
  if ((v14 & 8) == 0)
  {
LABEL_21:
    if ((v14 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
LABEL_38:
  v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 77)];
  if (a2) {
    v28 = @"includeCoverPhoto";
  }
  else {
    v28 = @"include_cover_photo";
  }
  [v4 setObject:v27 forKey:v28];

  if ((*(unsigned char *)(a1 + 80) & 4) != 0)
  {
LABEL_22:
    v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
    if (a2) {
      v16 = @"coverPhotoFirst";
    }
    else {
      v16 = @"cover_photo_first";
    }
    [v4 setObject:v15 forKey:v16];
  }
LABEL_26:
  v17 = *(void **)(a1 + 16);
  if (v17)
  {
    v18 = [v17 dictionaryRepresentation];
    v19 = v18;
    if (a2)
    {
      v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __58__GEOPDCategorizedPhotosFilter__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E53D8860;
      id v21 = v20;
      id v30 = v21;
      [v19 enumerateKeysAndObjectsUsingBlock:v29];
      id v22 = v21;

      v19 = v22;
    }
    [v4 setObject:v19 forKey:@"Unknown Fields"];
  }
LABEL_30:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCategorizedPhotosFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOPDCategorizedPhotosFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
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
  return GEOPDCategorizedPhotosFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)self, 0);
    unint64_t photoSizeFiltersCount = self->_photoSizeFiltersCount;
    if (photoSizeFiltersCount)
    {
      -[GEOPDCategorizedPhotosFilter _reservePhotoSizeFilters:](v5, photoSizeFiltersCount);
      memcpy(*(void **)(v5 + 24), self->_photoSizeFilters, 12 * self->_photoSizeFiltersCount);
      *(void *)(v5 + 32) = self->_photoSizeFiltersCount;
    }
    uint64_t v10 = [(NSString *)self->_categoryId copyWithZone:a3];
    id v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_startIndex;
      *(unsigned char *)(v5 + 80) |= 2u;
      char flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_9:
        if ((flags & 8) == 0) {
          goto LABEL_10;
        }
        goto LABEL_16;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 68) = self->_count;
    *(unsigned char *)(v5 + 80) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_10:
      if ((flags & 4) == 0)
      {
LABEL_12:
        v13 = self->_unknownFields;
        id v8 = *(id *)(v5 + 16);
        *(void *)(v5 + 16) = v13;
        goto LABEL_13;
      }
LABEL_11:
      *(unsigned char *)(v5 + 76) = self->_coverPhotoFirst;
      *(unsigned char *)(v5 + 80) |= 4u;
      goto LABEL_12;
    }
LABEL_16:
    *(unsigned char *)(v5 + 77) = self->_includeCoverPhoto;
    *(unsigned char *)(v5 + 80) |= 8u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  unint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDCategorizedPhotosFilterReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_13:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)self, 1);
  -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)v4, 1);
  unint64_t photoSizeFiltersCount = self->_photoSizeFiltersCount;
  if ((const void *)photoSizeFiltersCount != v4[4]) {
    goto LABEL_4;
  }
  if (memcmp(self->_photoSizeFilters, v4[3], 12 * photoSizeFiltersCount)) {
    goto LABEL_4;
  }
  categoryId = self->_categoryId;
  if ((unint64_t)categoryId | (unint64_t)v4[6])
  {
    if (!-[NSString isEqual:](categoryId, "isEqual:")) {
      goto LABEL_4;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if (((_BYTE)v4[10] & 2) == 0 || self->_startIndex != *((_DWORD *)v4 + 18)) {
      goto LABEL_4;
    }
  }
  else if (((_BYTE)v4[10] & 2) != 0)
  {
    goto LABEL_4;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (((_BYTE)v4[10] & 1) == 0 || self->_count != *((_DWORD *)v4 + 17)) {
      goto LABEL_4;
    }
  }
  else if ((_BYTE)v4[10])
  {
    goto LABEL_4;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if (((_BYTE)v4[10] & 8) == 0) {
      goto LABEL_4;
    }
    if (self->_includeCoverPhoto)
    {
      if (!*((unsigned char *)v4 + 77)) {
        goto LABEL_4;
      }
    }
    else if (*((unsigned char *)v4 + 77))
    {
      goto LABEL_4;
    }
  }
  else if (((_BYTE)v4[10] & 8) != 0)
  {
    goto LABEL_4;
  }
  BOOL v6 = ((_BYTE)v4[10] & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_5;
  }
  if (((_BYTE)v4[10] & 4) != 0)
  {
    if (self->_coverPhotoFirst)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_4;
      }
LABEL_32:
      BOOL v6 = 1;
      goto LABEL_5;
    }
    if (!*((unsigned char *)v4 + 76)) {
      goto LABEL_32;
    }
  }
LABEL_4:
  BOOL v6 = 0;
LABEL_5:

  return v6;
}

@end