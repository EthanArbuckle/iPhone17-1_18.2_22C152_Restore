@interface GEOPDGuidesHomeResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDGuidesHomeResult)init;
- (GEOPDGuidesHomeResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featuredGuides;
- (id)filteredGuides;
- (id)filters;
- (id)jsonRepresentation;
- (id)repeatableSections;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1;
- (unint64_t)hash;
- (void)_addNoFlagsRepeatableSection:(uint64_t)a1;
- (void)_readFeaturedGuides;
- (void)_readFilteredGuides;
- (void)_readFilters;
- (void)_readRepeatableSections;
- (void)addRepeatableSection:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setFeaturedGuides:(uint64_t)a1;
- (void)setFilteredGuides:(uint64_t)a1;
- (void)setFilters:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDGuidesHomeResult

- (GEOPDGuidesHomeResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesHomeResult;
  v2 = [(GEOPDGuidesHomeResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesHomeResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesHomeResult;
  v3 = [(GEOPDGuidesHomeResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readFeaturedGuides
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
        GEOPDGuidesHomeResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeaturedGuides_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)featuredGuides
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGuidesHomeResult _readFeaturedGuides]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFeaturedGuides:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 2u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)filters
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGuidesHomeResult _readFilters]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFilters:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 8u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readFilteredGuides
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilteredGuides_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)filteredGuides
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGuidesHomeResult _readFilteredGuides]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFilteredGuides:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 68) |= 4u;
  *(unsigned char *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readRepeatableSections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesHomeResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRepeatableSections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)repeatableSections
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDGuidesHomeResult _readRepeatableSections]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addRepeatableSection:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDGuidesHomeResult _readRepeatableSections](a1);
    -[GEOPDGuidesHomeResult _addNoFlagsRepeatableSection:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsRepeatableSection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDGuidesHomeResult;
  id v4 = [(GEOPDGuidesHomeResult *)&v8 description];
  id v5 = [(GEOPDGuidesHomeResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesHomeResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDGuidesHomeResult readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDGuidesHomeResult featuredGuides]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"featuredGuides";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"featured_guides";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = -[GEOPDGuidesHomeResult filters]((id *)a1);
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"filters"];
    }
    v12 = -[GEOPDGuidesHomeResult filteredGuides]((id *)a1);
    v13 = v12;
    if (v12)
    {
      if (a2)
      {
        v14 = [v12 jsonRepresentation];
        v15 = @"filteredGuides";
      }
      else
      {
        v14 = [v12 dictionaryRepresentation];
        v15 = @"filtered_guides";
      }
      [v4 setObject:v14 forKey:v15];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v17 = *(id *)(a1 + 48);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if (a2) {
              [v22 jsonRepresentation];
            }
            else {
            v23 = [v22 dictionaryRepresentation];
            }
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v19);
      }

      if (a2) {
        v24 = @"repeatableSection";
      }
      else {
        v24 = @"repeatable_section";
      }
      [v4 setObject:v16 forKey:v24];
    }
    v25 = *(void **)(a1 + 16);
    if (v25)
    {
      v26 = [v25 dictionaryRepresentation];
      v27 = v26;
      if (a2)
      {
        v28 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __51__GEOPDGuidesHomeResult__dictionaryRepresentation___block_invoke;
        v32[3] = &unk_1E53D8860;
        id v29 = v28;
        id v33 = v29;
        [v27 enumerateKeysAndObjectsUsingBlock:v32];
        id v30 = v29;

        v27 = v30;
      }
      [v4 setObject:v27 forKey:@"Unknown Fields"];
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
  return -[GEOPDGuidesHomeResult _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_3222;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_3223;
      }
      GEOPDGuidesHomeResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDGuidesHomeResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __51__GEOPDGuidesHomeResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDGuidesHomeResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGuidesHomeResultIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesHomeResult readAll:]((uint64_t)self, 0);
    if (self->_featuredGuides) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_filters) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_filteredGuides) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_repeatableSections;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  -[GEOPDGuidesHomeResult _readFeaturedGuides](a1);
  if (-[GEOPDGuidesHomeFixedSection hasGreenTeaWithValue:](*(void *)(a1 + 24), a2)) {
    return 1;
  }
  -[GEOPDGuidesHomeResult _readFilteredGuides](a1);
  if (-[GEOPDGuidesHomeFixedSection hasGreenTeaWithValue:](*(void *)(a1 + 32), a2)) {
    return 1;
  }
  -[GEOPDGuidesHomeResult _readFilters](a1);
  if (-[GEOPDGuidesHomeFixedSection hasGreenTeaWithValue:](*(void *)(a1 + 40), a2)) {
    return 1;
  }
  -[GEOPDGuidesHomeResult _readRepeatableSections](a1);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (!v7)
  {
    uint64_t v4 = 0;
    goto LABEL_43;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v27;
  id v10 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
      if (v12)
      {
        -[GEOPDGuidesHomeRepeatableSection _readCarouselGuideIds](*(void *)(*((void *)&v26 + 1) + 8 * i));
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v13 = *(id *)(v12 + v10[302]);
        uint64_t v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v45, 16, (void)v26);
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v39;
LABEL_15:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v39 != v16) {
              objc_enumerationMutation(v13);
            }
            if ([*(id *)(*((void *)&v38 + 1) + 8 * v17) hasGreenTeaWithValue:a2]) {
              goto LABEL_41;
            }
            if (v15 == ++v17)
            {
              uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v45 count:16];
              if (v15) {
                goto LABEL_15;
              }
              break;
            }
          }
        }

        -[GEOPDGuidesHomeRepeatableSection _readGuidesLocationEntrys](v12);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v13 = *(id *)(v12 + 32);
        uint64_t v18 = [v13 countByEnumeratingWithState:&v34 objects:v44 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v35;
LABEL_23:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v13);
            }
            if (-[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(void *)(*((void *)&v34 + 1) + 8 * v21), a2)) {
              goto LABEL_41;
            }
            if (v19 == ++v21)
            {
              uint64_t v19 = [v13 countByEnumeratingWithState:&v34 objects:v44 count:16];
              if (v19) {
                goto LABEL_23;
              }
              break;
            }
          }
        }

        -[GEOPDGuidesHomeRepeatableSection _readPublisherIds](v12);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v13 = *(id *)(v12 + 48);
        uint64_t v22 = [v13 countByEnumeratingWithState:&v30 objects:v43 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v31;
LABEL_31:
          uint64_t v25 = 0;
          while (1)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v13);
            }
            if ([*(id *)(*((void *)&v30 + 1) + 8 * v25) hasGreenTeaWithValue:a2]) {
              break;
            }
            if (v23 == ++v25)
            {
              uint64_t v23 = [v13 countByEnumeratingWithState:&v30 objects:v43 count:16];
              if (v23) {
                goto LABEL_31;
              }
              goto LABEL_37;
            }
          }
LABEL_41:

          uint64_t v4 = 1;
          goto LABEL_43;
        }
LABEL_37:
      }
      id v10 = &OBJC_IVAR___GEOMapDataSubscriptionDownloadGroup__completedSubscriptions;
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v42 count:16];
    uint64_t v4 = 0;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_43:

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
      GEOPDGuidesHomeResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesHomeResult readAll:]((uint64_t)self, 0);
  id v8 = [(GEOPDGuidesHomeFixedSection *)self->_featuredGuides copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(GEOPDGuidesHomeFixedSection *)self->_filters copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  id v12 = [(GEOPDGuidesHomeFixedSection *)self->_filteredGuides copyWithZone:a3];
  id v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v14 = self->_repeatableSections;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        -[GEOPDGuidesHomeResult addRepeatableSection:](v5, v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDGuidesHomeResult readAll:]((uint64_t)self, 1),
         -[GEOPDGuidesHomeResult readAll:]((uint64_t)v4, 1),
         featuredGuides = self->_featuredGuides,
         !((unint64_t)featuredGuides | v4[3]))
     || -[GEOPDGuidesHomeFixedSection isEqual:](featuredGuides, "isEqual:"))
    && ((filters = self->_filters, !((unint64_t)filters | v4[5]))
     || -[GEOPDGuidesHomeFixedSection isEqual:](filters, "isEqual:"))
    && ((filteredGuides = self->_filteredGuides, !((unint64_t)filteredGuides | v4[4]))
     || -[GEOPDGuidesHomeFixedSection isEqual:](filteredGuides, "isEqual:")))
  {
    repeatableSections = self->_repeatableSections;
    if ((unint64_t)repeatableSections | v4[6]) {
      char v9 = -[NSMutableArray isEqual:](repeatableSections, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDGuidesHomeResult readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDGuidesHomeFixedSection *)self->_featuredGuides hash];
  unint64_t v4 = [(GEOPDGuidesHomeFixedSection *)self->_filters hash] ^ v3;
  unint64_t v5 = [(GEOPDGuidesHomeFixedSection *)self->_filteredGuides hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_repeatableSections hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatableSections, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_filteredGuides, 0);
  objc_storeStrong((id *)&self->_featuredGuides, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end