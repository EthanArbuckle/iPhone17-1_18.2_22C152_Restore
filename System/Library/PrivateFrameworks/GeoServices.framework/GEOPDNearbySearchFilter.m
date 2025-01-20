@interface GEOPDNearbySearchFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)addIncludedCategoryFilter:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDNearbySearchFilter

- (void)addIncludedCategoryFilter:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDNearbySearchFilter;
  v4 = [(GEOPDNearbySearchFilter *)&v8 description];
  id v5 = [(GEOPDNearbySearchFilter *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDNearbySearchFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v5 = 0;
    goto LABEL_23;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = v4;
  if (*(void *)(a1 + 16)) {
    objc_msgSend(v4, "setObject:forKey:");
  }
  if (*(unsigned char *)(a1 + 28))
  {
    int v6 = *(_DWORD *)(a1 + 24);
    if (v6 > 1)
    {
      if (v6 == 2)
      {
        id v7 = @"POI_AGE_FILTER_LAST_6_MONTHS";
        goto LABEL_15;
      }
      if (v6 == 10)
      {
        id v7 = @"POI_AGE_FILTER_SERVER";
        goto LABEL_15;
      }
    }
    else
    {
      if (!v6)
      {
        id v7 = @"POI_AGE_FILTER_NONE";
        goto LABEL_15;
      }
      if (v6 == 1)
      {
        id v7 = @"POI_AGE_FILTER_LAST_MONTH";
LABEL_15:
        if (a2) {
          objc_super v8 = @"poiAgeFilter";
        }
        else {
          objc_super v8 = @"poi_age_filter";
        }
        [v5 setObject:v7 forKey:v8];

        goto LABEL_19;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 24));
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_19:
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    v10 = [v9 dictionaryRepresentation];
    v11 = v10;
    if (a2)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __53__GEOPDNearbySearchFilter__dictionaryRepresentation___block_invoke;
      v16[3] = &unk_1E53D8860;
      id v13 = v12;
      id v17 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v16];
      id v14 = v13;

      v11 = v14;
    }
    [v5 setObject:v11 forKey:@"Unknown Fields"];
  }
LABEL_23:

  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDNearbySearchFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOPDNearbySearchFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDNearbySearchFilterReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_includedCategoryFilters;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_includedCategoryFilters;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        -[GEOPDNearbySearchFilter addIncludedCategoryFilter:](v5, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 24) = self->_poiAgeFilter;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  includedCategoryFilters = self->_includedCategoryFilters;
  if ((unint64_t)includedCategoryFilters | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](includedCategoryFilters, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_poiAgeFilter == *((_DWORD *)v4 + 6))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_includedCategoryFilters hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_poiAgeFilter;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedCategoryFilters, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end