@interface GEOPDPhotoFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_reservePhotoSizeFilters:(uint64_t)a1;
- (uint64_t)addPhotoSizeFilter:(int)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPhotoFilter

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
  v3.super_class = (Class)GEOPDPhotoFilter;
  [(GEOPDPhotoFilter *)&v3 dealloc];
}

- (uint64_t)_reservePhotoSizeFilters:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 32);
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 12 * v9, 0xFB427F01uLL);
    if (result)
    {
      *(void *)(a1 + 32) = v9;
      *(void *)(a1 + 16) = result;
      bzero((void *)(result + 12 * *(void *)(a1 + 24)), 12 * (v9 - *(void *)(a1 + 24)));
      return 1;
    }
  }
  return result;
}

- (uint64_t)addPhotoSizeFilter:(int)a3
{
  if (result)
  {
    uint64_t v5 = result;
    uint64_t result = -[GEOPDPhotoFilter _reservePhotoSizeFilters:](result, 1uLL);
    if (result)
    {
      uint64_t v6 = *(void *)(v5 + 16) + 12 * *(void *)(v5 + 24);
      *(void *)uint64_t v6 = a2;
      *(_DWORD *)(v6 + 8) = a3;
      ++*(void *)(v5 + 24);
    }
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPhotoFilter;
  unint64_t v4 = [(GEOPDPhotoFilter *)&v8 description];
  uint64_t v5 = [(GEOPDPhotoFilter *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPhotoFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[3])
    {
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1[3]];
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
        unint64_t v9 = @"photoSizeFilter";
      }
      else {
        unint64_t v9 = @"photo_size_filter";
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
        v17[2] = __46__GEOPDPhotoFilter__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDPhotoFilter _dictionaryRepresentation:](self, 1);
}

void __46__GEOPDPhotoFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPhotoFilterReadAllFrom(self, a3);
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
    -[GEOPDPhotoFilter _reservePhotoSizeFilters:](v4, photoSizeFiltersCount);
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