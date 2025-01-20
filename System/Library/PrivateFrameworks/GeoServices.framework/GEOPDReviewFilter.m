@interface GEOPDReviewFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
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

@implementation GEOPDReviewFilter

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
  v3.super_class = (Class)GEOPDReviewFilter;
  [(GEOPDReviewFilter *)&v3 dealloc];
}

- (unint64_t)hash
{
  uint64_t v3 = PBHashBytes();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_suppressSyntheticReviews;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
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
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteBOOLField();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (uint64_t)addPhotoSizeFilter:(int)a3
{
  if (result)
  {
    uint64_t v5 = result;
    result = -[GEOPDReviewFilter _reservePhotoSizeFilters:](result, 1uLL);
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
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 12 * v9, 0x2DD92C00uLL);
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

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDReviewFilter;
  unint64_t v4 = [(GEOPDReviewFilter *)&v8 description];
  unint64_t v5 = [(GEOPDReviewFilter *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDReviewFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 24)];
      if (*(void *)(a1 + 24))
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        do
        {
          objc_super v8 = _GEOPDPhotoSizeFilterValueDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 16) + v6));
          [v5 addObject:v8];

          ++v7;
          v6 += 12;
        }
        while (v7 < *(void *)(a1 + 24));
      }
      if (a2) {
        unint64_t v9 = @"photoSizeFilter";
      }
      else {
        unint64_t v9 = @"photo_size_filter";
      }
      [v4 setObject:v5 forKey:v9];
    }
    if (*(unsigned char *)(a1 + 44))
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
      if (a2) {
        v11 = @"suppressSyntheticReviews";
      }
      else {
        v11 = @"suppress_synthetic_reviews";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __47__GEOPDReviewFilter__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOPDReviewFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDReviewFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDReviewFilterReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  unint64_t photoSizeFiltersCount = self->_photoSizeFiltersCount;
  if (photoSizeFiltersCount)
  {
    -[GEOPDReviewFilter _reservePhotoSizeFilters:](v4, photoSizeFiltersCount);
    memcpy(*(void **)(v5 + 16), self->_photoSizeFilters, 12 * self->_photoSizeFiltersCount);
    *(void *)(v5 + 24) = self->_photoSizeFiltersCount;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 40) = self->_suppressSyntheticReviews;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t photoSizeFiltersCount = self->_photoSizeFiltersCount;
    if (photoSizeFiltersCount == *((void *)v4 + 3)
      && !memcmp(self->_photoSizeFilters, *((const void **)v4 + 2), 12 * photoSizeFiltersCount))
    {
      BOOL v6 = (*((unsigned char *)v4 + 44) & 1) == 0;
      if ((*(unsigned char *)&self->_flags & 1) == 0) {
        goto LABEL_5;
      }
      if (*((unsigned char *)v4 + 44))
      {
        if (self->_suppressSyntheticReviews)
        {
          if (!*((unsigned char *)v4 + 40)) {
            goto LABEL_4;
          }
LABEL_12:
          BOOL v6 = 1;
          goto LABEL_5;
        }
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_12;
        }
      }
    }
  }
LABEL_4:
  BOOL v6 = 0;
LABEL_5:

  return v6;
}

@end