@interface GEOPDSearchResultPlacePhotoFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_reservePhotoSizeFilters:(uint64_t)result;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchResultPlacePhotoFilter

- (void)dealloc
{
  if (self)
  {
    self->_photoSizeFiltersSpace = 0;
    self->_photoSizeFiltersCount = 0;
    free(self->_photoSizeFilters);
    self->_photoSizeFilters = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchResultPlacePhotoFilter;
  [(GEOPDSearchResultPlacePhotoFilter *)&v3 dealloc];
}

- (uint64_t)_reservePhotoSizeFilters:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    unint64_t v3 = *(void *)(result + 24);
    unint64_t v4 = v3 + a2;
    if (v3 + a2 <= v3) {
      return 0;
    }
    unint64_t v5 = *(void *)(result + 32);
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
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 16), 12 * v8, 0xD7F94A89uLL);
    if (result)
    {
      v2[4] = v8;
      v2[2] = result;
      bzero((void *)(result + 12 * v2[3]), 12 * (v8 - v2[3]));
      return 1;
    }
  }
  return result;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchResultPlacePhotoFilter;
  unint64_t v4 = [(GEOPDSearchResultPlacePhotoFilter *)&v8 description];
  unint64_t v5 = [(GEOPDSearchResultPlacePhotoFilter *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchResultPlacePhotoFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[3])
    {
      unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[3]];
      if (a1[3])
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        do
        {
          objc_super v8 = _GEOPDPhotoSizeFilterValueDictionaryRepresentation((unsigned int *)(a1[2] + v6));
          [v5 addObject:v8];

          ++v7;
          v6 += 12;
        }
        while (v7 < a1[3]);
      }
      if (a2) {
        v9 = @"photoSizeFilter";
      }
      else {
        v9 = @"photo_size_filter";
      }
      [v4 setObject:v5 forKey:v9];
    }
    v10 = (void *)a1[1];
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __63__GEOPDSearchResultPlacePhotoFilter__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchResultPlacePhotoFilter _dictionaryRepresentation:](self, 1);
}

void __63__GEOPDSearchResultPlacePhotoFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDSearchResultPlacePhotoFilterReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_photoSizeFiltersCount)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOPDPhotoSizeFilterValueWriteTo((uint64_t)&self->_photoSizeFilters[v5]);
      PBDataWriterRecallMark();
      ++v6;
      ++v5;
    }
    while (v6 < self->_photoSizeFiltersCount);
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  unint64_t photoSizeFiltersCount = self->_photoSizeFiltersCount;
  if (photoSizeFiltersCount)
  {
    -[GEOPDSearchResultPlacePhotoFilter _reservePhotoSizeFilters:](v4, photoSizeFiltersCount);
    memcpy(*(void **)(v5 + 16), self->_photoSizeFilters, 12 * self->_photoSizeFiltersCount);
    *(void *)(v5 + 24) = self->_photoSizeFiltersCount;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t photoSizeFiltersCount = self->_photoSizeFiltersCount, (const void *)photoSizeFiltersCount == v4[3])
    && memcmp(self->_photoSizeFilters, v4[2], 12 * photoSizeFiltersCount) == 0;

  return v6;
}

- (unint64_t)hash
{
  return PBHashBytes();
}

- (void).cxx_destruct
{
}

@end