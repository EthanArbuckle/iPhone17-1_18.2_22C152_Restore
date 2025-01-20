@interface GEOPDResultSnippet
+ (id)resultSnippetForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDResultSnippet)init;
- (GEOPDResultSnippet)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)category;
- (id)childItems;
- (id)childPlaces;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)locationString;
- (id)name;
- (id)priceRange;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)_addNoFlagsChildItem:(uint64_t)a1;
- (void)_addNoFlagsChildPlace:(uint64_t)a1;
- (void)_readCategory;
- (void)_readChildItems;
- (void)_readChildPlaces;
- (void)_readLocationString;
- (void)_readName;
- (void)_readPriceRange;
- (void)addChildItem:(uint64_t)a1;
- (void)addChildPlace:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDResultSnippet

- (GEOPDResultSnippet)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultSnippet;
  v2 = [(GEOPDResultSnippet *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceRange, 0);
  objc_storeStrong((id *)&self->_priceDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_childPlaces, 0);
  objc_storeStrong((id *)&self->_childItems, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  uint64_t v6 = 8;
  if (self->_reader
    && (os_unfair_lock_assert_owner(&self->_readerLock), __int16 flags = (__int16)self->_flags, (flags & 0x3FC) == 0))
  {
    if ((flags & 8) != 0)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      obuint64_t j = self->_childItems;
      uint64_t v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(obj);
            }
            v19 = p_readerLock;
            uint64_t v20 = v6;
            v21 = *(os_unfair_lock_s **)(*((void *)&v34 + 1) + 8 * i);
            if (v21)
            {
              os_unfair_lock_lock_with_options();
              char IsDirty = _GEOPDChildItemIsDirty((uint64_t)v21);
              os_unfair_lock_unlock(v21 + 12);
              if (IsDirty)
              {

                p_readerLocuint64_t k = v19;
                goto LABEL_3;
              }
            }
            uint64_t v6 = v20;
            p_readerLocuint64_t k = v19;
          }
          uint64_t v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v40 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
    }
    id v23 = *(id *)((char *)&self->super.super.isa + v6);
    objc_sync_enter(v23);
    *(void *)(*(char **)((char *)&self->super.super.isa + v6) + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [*(id *)((char *)&self->super.super.isa + v6) seekToOffset:self->_readerMarkPos];
    v24 = [*(id *)((char *)&self->super.super.isa + v6) readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v24];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v23);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(p_readerLock);
    -[GEOPDResultSnippet readAll:]((uint64_t)self, 0);
    if (self->_name) {
      PBDataWriterWriteStringField();
    }
    if (self->_category) {
      PBDataWriterWriteStringField();
    }
    if (self->_priceRange) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_locationString) {
      PBDataWriterWriteStringField();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = self->_childPlaces;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v9);
    }

    if (self->_priceDescription) {
      PBDataWriterWriteSubmessage();
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v12 = self->_childItems;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t k = 0; k != v13; ++k)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v12);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v13);
    }

    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

+ (id)resultSnippetForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__GEOPDResultSnippet_PlaceDataExtras__resultSnippetForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:30 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__GEOPDResultSnippet_PlaceDataExtras__resultSnippetForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue resultSnippet](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = a1;
  -[GEOPDResultSnippet _readChildItems](a1);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = *(id *)(v3 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    uint64_t v20 = v3;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * v8);
      if (v9)
      {
        -[GEOPDChildItem _readChildAction](*(void *)(*((void *)&v25 + 1) + 8 * v8));
        uint64_t v10 = *(void *)(v9 + 24);
        if (v10)
        {
          -[GEOPDChildAction _readChildActionGuides](*(void *)(v9 + 24));
          uint64_t v11 = *(void *)(v10 + 48);
          if (v11)
          {
            if (-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(void *)(v11 + 16), a2)) {
              goto LABEL_25;
            }
          }
        }
        -[GEOPDChildItem _readChildPlace](v9);
        uint64_t v12 = *(void *)(v9 + 32);
        if (v12)
        {
          -[GEOPDChildPlace _readMapsId](v12);
          if ([*(id *)(v12 + 24) hasGreenTeaWithValue:a2]) {
            goto LABEL_25;
          }
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
        uint64_t v3 = v20;
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  -[GEOPDResultSnippet _readChildPlaces](v3);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = *(id *)(v3 + 40);
  uint64_t v13 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
LABEL_17:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v4);
      }
      uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
      if (v17)
      {
        -[GEOPDChildPlace _readMapsId](*(void *)(*((void *)&v21 + 1) + 8 * v16));
        if ([*(id *)(v17 + 24) hasGreenTeaWithValue:a2]) {
          break;
        }
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14) {
          goto LABEL_17;
        }
        goto LABEL_24;
      }
    }
LABEL_25:
    uint64_t v18 = 1;
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v18 = 0;
LABEL_26:

  return v18;
}

- (GEOPDResultSnippet)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultSnippet;
  uint64_t v3 = [(GEOPDResultSnippet *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readName
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
        GEOPDResultSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readName_tags_8248);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)name
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultSnippet _readName]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readCategory
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
        GEOPDResultSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategory_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)category
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultSnippet _readCategory]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPriceRange
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
        GEOPDResultSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPriceRange_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)priceRange
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultSnippet _readPriceRange]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLocationString
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
        GEOPDResultSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocationString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)locationString
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultSnippet _readLocationString]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readChildPlaces
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
        GEOPDResultSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildPlaces_tags_8249);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)childPlaces
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultSnippet _readChildPlaces]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addChildPlace:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDResultSnippet _readChildPlaces](a1);
    -[GEOPDResultSnippet _addNoFlagsChildPlace:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsChildPlace:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readChildItems
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
        GEOPDResultSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readChildItems_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (id)childItems
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDResultSnippet _readChildItems]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addChildItem:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDResultSnippet _readChildItems](a1);
    -[GEOPDResultSnippet _addNoFlagsChildItem:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_WORD *)(a1 + 96) |= 0x200u;
  }
}

- (void)_addNoFlagsChildItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDResultSnippet;
  id v4 = [(GEOPDResultSnippet *)&v8 description];
  id v5 = [(GEOPDResultSnippet *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultSnippet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDResultSnippet readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDResultSnippet name]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"name"];
    }

    uint64_t v6 = -[GEOPDResultSnippet category]((id *)a1);
    if (v6) {
      [v4 setObject:v6 forKey:@"category"];
    }

    id v7 = -[GEOPDResultSnippet priceRange]((id *)a1);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        uint64_t v9 = [v7 jsonRepresentation];
        uint64_t v10 = @"priceRange";
      }
      else
      {
        uint64_t v9 = [v7 dictionaryRepresentation];
        uint64_t v10 = @"price_range";
      }
      [v4 setObject:v9 forKey:v10];
    }
    uint64_t v11 = -[GEOPDResultSnippet locationString]((id *)a1);
    if (v11)
    {
      if (a2) {
        uint64_t v12 = @"locationString";
      }
      else {
        uint64_t v12 = @"location_string";
      }
      [v4 setObject:v11 forKey:v12];
    }

    if (*(_WORD *)(a1 + 96))
    {
      uint64_t v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      if (a2) {
        uint64_t v14 = @"distanceDisplayThreshold";
      }
      else {
        uint64_t v14 = @"distance_display_threshold";
      }
      [v4 setObject:v13 forKey:v14];
    }
    if ([*(id *)(a1 + 40) count])
    {
      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v51 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            long long v21 = [v20 dictionaryRepresentation];
            }
            [v15 addObject:v21];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v17);
      }

      if (a2) {
        long long v22 = @"childPlace";
      }
      else {
        long long v22 = @"child_place";
      }
      [v4 setObject:v15 forKey:v22];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      long long v23 = *(void **)(a1 + 8);
      if (v23)
      {
        id v24 = v23;
        objc_sync_enter(v24);
        GEOPDResultSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPriceDescription_tags);
        objc_sync_exit(v24);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    id v25 = *(id *)(a1 + 64);
    long long v26 = v25;
    if (v25)
    {
      if (a2)
      {
        long long v27 = [v25 jsonRepresentation];
        long long v28 = @"priceDescription";
      }
      else
      {
        long long v27 = [v25 dictionaryRepresentation];
        long long v28 = @"price_description";
      }
      [v4 setObject:v27 forKey:v28];
    }
    if ([*(id *)(a1 + 32) count])
    {
      long long v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v30 = *(id *)(a1 + 32);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v47 != v32) {
              objc_enumerationMutation(v30);
            }
            long long v34 = *(void **)(*((void *)&v46 + 1) + 8 * j);
            if (a2) {
              [v34 jsonRepresentation];
            }
            else {
            long long v35 = [v34 dictionaryRepresentation];
            }
            [v29 addObject:v35];
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v54 count:16];
        }
        while (v31);
      }

      if (a2) {
        long long v36 = @"childItem";
      }
      else {
        long long v36 = @"child_item";
      }
      [v4 setObject:v29 forKey:v36];
    }
    long long v37 = *(void **)(a1 + 16);
    if (v37)
    {
      v38 = [v37 dictionaryRepresentation];
      v39 = v38;
      if (a2)
      {
        v40 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __48__GEOPDResultSnippet__dictionaryRepresentation___block_invoke;
        v44[3] = &unk_1E53D8860;
        id v41 = v40;
        id v45 = v41;
        [v39 enumerateKeysAndObjectsUsingBlock:v44];
        id v42 = v41;
      }
      else
      {
        id v42 = v38;
      }
      [v4 setObject:v42 forKey:@"Unknown Fields"];
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
  return -[GEOPDResultSnippet _dictionaryRepresentation:]((uint64_t)self, 1);
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
        uint64_t v6 = (int *)&readAll__recursiveTag_8272;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_8273;
      }
      GEOPDResultSnippetReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDResultSnippetCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __48__GEOPDResultSnippet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultSnippetReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
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
      GEOPDResultSnippetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultSnippet readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  id v10 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v9;

  uint64_t v11 = [(NSString *)self->_category copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEOPDRating *)self->_priceRange copyWithZone:a3];
  uint64_t v14 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v13;

  uint64_t v15 = [(NSString *)self->_locationString copyWithZone:a3];
  id v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 92) = self->_distanceDisplayThreshold;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v17 = self->_childPlaces;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v17);
        }
        long long v21 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDResultSnippet addChildPlace:](v5, v21);
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v18);
  }

  id v22 = [(GEOPDPriceDescription *)self->_priceDescription copyWithZone:a3];
  long long v23 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v22;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v24 = self->_childItems;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v24);
        }
        long long v28 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "copyWithZone:", a3, (void)v31);
        -[GEOPDResultSnippet addChildItem:](v5, v28);
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v25);
  }

  long long v29 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v29;
LABEL_22:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  -[GEOPDResultSnippet readAll:]((uint64_t)self, 1);
  -[GEOPDResultSnippet readAll:]((uint64_t)v4, 1);
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_21;
    }
  }
  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](category, "isEqual:")) {
      goto LABEL_21;
    }
  }
  priceRange = self->_priceRange;
  if ((unint64_t)priceRange | *((void *)v4 + 9))
  {
    if (!-[GEOPDRating isEqual:](priceRange, "isEqual:")) {
      goto LABEL_21;
    }
  }
  locationString = self->_locationString;
  if ((unint64_t)locationString | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](locationString, "isEqual:")) {
      goto LABEL_21;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 48);
  if (*(_WORD *)&self->_flags)
  {
    if ((v9 & 1) == 0 || self->_distanceDisplayThreshold != *((_DWORD *)v4 + 23)) {
      goto LABEL_21;
    }
  }
  else if (v9)
  {
LABEL_21:
    char v13 = 0;
    goto LABEL_22;
  }
  childPlaces = self->_childPlaces;
  if ((unint64_t)childPlaces | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](childPlaces, "isEqual:"))
  {
    goto LABEL_21;
  }
  priceDescription = self->_priceDescription;
  if ((unint64_t)priceDescription | *((void *)v4 + 8))
  {
    if (!-[GEOPDPriceDescription isEqual:](priceDescription, "isEqual:")) {
      goto LABEL_21;
    }
  }
  childItems = self->_childItems;
  if ((unint64_t)childItems | *((void *)v4 + 4)) {
    char v13 = -[NSMutableArray isEqual:](childItems, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_22:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDResultSnippet readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_category hash];
  unint64_t v5 = [(GEOPDRating *)self->_priceRange hash];
  NSUInteger v6 = [(NSString *)self->_locationString hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_distanceDisplayThreshold;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v9 = v7 ^ [(NSMutableArray *)self->_childPlaces hash];
  unint64_t v10 = v8 ^ v9 ^ [(GEOPDPriceDescription *)self->_priceDescription hash];
  return v10 ^ [(NSMutableArray *)self->_childItems hash];
}

@end