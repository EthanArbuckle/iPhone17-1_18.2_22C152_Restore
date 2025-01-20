@interface GEOPDCaptionedPhotoFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDCaptionedPhotoFilter)init;
- (GEOPDCaptionedPhotoFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_addNoFlagsPhotoSizeFilter:(int)a3;
- (uint64_t)_reservePhotoSizeFilters:(uint64_t)a1;
- (unint64_t)hash;
- (void)_readPhotoSizeFilters;
- (void)addPhotoSizeFilter:(int)a3;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setVendorId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDCaptionedPhotoFilter

- (void)dealloc
{
  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)&self->_flags |= 2u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(unsigned char *)&self->_flags |= 8u;
    self->_photoSizeFiltersSpace = 0;
    self->_photoSizeFiltersCount = 0;
    free(self->_photoSizeFilters);
    self->_photoSizeFilters = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDCaptionedPhotoFilter;
  [(GEOPDCaptionedPhotoFilter *)&v3 dealloc];
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_1284;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_1285;
      }
      GEOPDCaptionedPhotoFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)hash
{
  -[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBHashBytes();
  return [(NSString *)self->_vendorId hash] ^ v3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)self, 0);
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
    if (self->_vendorId) {
      PBDataWriterWriteStringField();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (void)addPhotoSizeFilter:(int)a3
{
  if (a1)
  {
    -[GEOPDCaptionedPhotoFilter _readPhotoSizeFilters](a1);
    [(GEOPDCaptionedPhotoFilter *)a1 _addNoFlagsPhotoSizeFilter:a3];
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 8u;
  }
}

- (void)_readPhotoSizeFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDCaptionedPhotoFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPhotoSizeFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (uint64_t)_addNoFlagsPhotoSizeFilter:(int)a3
{
  if (result)
  {
    uint64_t v5 = result;
    result = -[GEOPDCaptionedPhotoFilter _reservePhotoSizeFilters:](result, 1uLL);
    if (result)
    {
      uint64_t v6 = *(void *)(v5 + 24) + 12 * *(void *)(v5 + 32);
      *(void *)uint64_t v6 = a2;
      *(_DWORD *)(v6 + 8) = a3;
      ++*(void *)(v5 + 32);
    }
  }
  return result;
}

- (uint64_t)_reservePhotoSizeFilters:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (12 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0x25AA3467uLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 12 * *(void *)(a1 + 32)), 12 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (GEOPDCaptionedPhotoFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDCaptionedPhotoFilter;
  v2 = [(GEOPDCaptionedPhotoFilter *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDCaptionedPhotoFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDCaptionedPhotoFilter;
  id v3 = [(GEOPDCaptionedPhotoFilter *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v5 = v3;
  }

  return v4;
}

- (void)setVendorId:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 4u;
    *(unsigned char *)(a1 + 68) |= 8u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDCaptionedPhotoFilter;
  id v4 = [(GEOPDCaptionedPhotoFilter *)&v8 description];
  unint64_t v5 = [(GEOPDCaptionedPhotoFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCaptionedPhotoFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDCaptionedPhotoFilter readAll:](a1, 1);
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
        unint64_t v9 = @"photoSizeFilter";
      }
      else {
        unint64_t v9 = @"photo_size_filter";
      }
      [v4 setObject:v5 forKey:v9];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v10 = *(void **)(a1 + 8);
      if (v10)
      {
        id v11 = v10;
        objc_sync_enter(v11);
        GEOPDCaptionedPhotoFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVendorId_tags_1283);
        objc_sync_exit(v11);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v12 = *(id *)(a1 + 48);
    if (v12)
    {
      if (a2) {
        v13 = @"vendorId";
      }
      else {
        v13 = @"vendor_id";
      }
      [v4 setObject:v12 forKey:v13];
    }

    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __55__GEOPDCaptionedPhotoFilter__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDCaptionedPhotoFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDCaptionedPhotoFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
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
  return GEOPDCaptionedPhotoFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDCaptionedPhotoFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)self, 0);
  unint64_t photoSizeFiltersCount = self->_photoSizeFiltersCount;
  if (photoSizeFiltersCount)
  {
    -[GEOPDCaptionedPhotoFilter _reservePhotoSizeFilters:](v5, photoSizeFiltersCount);
    memcpy(*(void **)(v5 + 24), self->_photoSizeFilters, 12 * self->_photoSizeFiltersCount);
    *(void *)(v5 + 32) = self->_photoSizeFiltersCount;
  }
  uint64_t v9 = [(NSString *)self->_vendorId copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (-[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)self, 1),
        -[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)v4, 1),
        unint64_t photoSizeFiltersCount = self->_photoSizeFiltersCount,
        photoSizeFiltersCount == *((void *)v4 + 4))
    && !memcmp(self->_photoSizeFilters, *((const void **)v4 + 3), 12 * photoSizeFiltersCount))
  {
    vendorId = self->_vendorId;
    if ((unint64_t)vendorId | *((void *)v4 + 6)) {
      char v6 = -[NSString isEqual:](vendorId, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end