@interface GEOURLPresent
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOURLPresent)init;
- (GEOURLPresent)initWithData:(id)a3;
- (GEOURLPresent)initWithDirectionsOptions:(id)a3;
- (GEOURLPresent)initWithOptions:(id)a3;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)items;
- (id)jsonRepresentation;
- (id)options;
- (unint64_t)hash;
- (void)_addNoFlagsItem:(uint64_t)a1;
- (void)_readItems;
- (void)_readOptions;
- (void)addItem:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setOptions:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOURLPresent

- (GEOURLPresent)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOURLPresent;
  v2 = [(GEOURLPresent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOURLPresent)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOURLPresent;
  v3 = [(GEOURLPresent *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readItems
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLPresentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItems_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (id)items
{
  if (a1)
  {
    v2 = a1;
    -[GEOURLPresent _readItems]((uint64_t)a1);
    a1 = (id *)v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addItem:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOURLPresent _readItems](a1);
    -[GEOURLPresent _addNoFlagsItem:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 44) |= 1u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(unsigned char *)(a1 + 44) |= 4u;
  }
}

- (void)_addNoFlagsItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readOptions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOURLPresentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOptions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (id)options
{
  if (a1)
  {
    v2 = a1;
    -[GEOURLPresent _readOptions]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setOptions:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 44) |= 2u;
    *(unsigned char *)(a1 + 44) |= 4u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOURLPresent;
  id v4 = [(GEOURLPresent *)&v8 description];
  id v5 = [(GEOURLPresent *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOURLPresent _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOURLPresent readAll:]((uint64_t)a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[2] count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = a1[2];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v17);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"item"];
    }
    v13 = -[GEOURLPresent options](a1);
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      objc_msgSend(v4, "setObject:forKey:", v15, @"options", (void)v17);
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
  return -[GEOURLPresent _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (void)readAll:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_313;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_314;
      }
      GEOURLPresentReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = *(id *)(a1 + 16);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v7);
            }
            -[GEOURLItem readAll:](*(void *)(*((void *)&v11 + 1) + 8 * i), 1);
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }

      objc_msgSend(*(id *)(a1 + 24), "readAll:", 1, (void)v11);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOURLPresentReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_3;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  char flags = (char)self->_flags;
  if ((flags & 5) != 0) {
    goto LABEL_3;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if (GEOURLOptionsIsDirty((os_unfair_lock_s *)self->_options))
    {
LABEL_3:
      os_unfair_lock_unlock(&self->_readerLock);
      -[GEOURLPresent readAll:]((uint64_t)self, 0);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = self->_items;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v20 != v9) {
              objc_enumerationMutation(v7);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v8);
      }

      if (self->_options) {
        PBDataWriterWriteSubmessage();
      }
      goto LABEL_12;
    }
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v11 = self->_items;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(os_unfair_lock_s **)(*((void *)&v23 + 1) + 8 * j);
          if (v15)
          {
            os_unfair_lock_lock_with_options();
            char IsDirty = _GEOURLItemIsDirty((uint64_t)v15);
            os_unfair_lock_unlock(v15 + 10);
            if (IsDirty)
            {

              goto LABEL_3;
            }
          }
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  long long v17 = self->_reader;
  objc_sync_enter(v17);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  long long v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v4 writeData:v18];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v17);
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOURLPresentReadAllFrom((uint64_t)v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOURLPresent readAll:]((uint64_t)self, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_items;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        -[GEOURLPresent addItem:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  id v13 = [(GEOURLOptions *)self->_options copyWithZone:a3];
  long long v14 = (void *)v5[3];
  v5[3] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOURLPresent readAll:]((uint64_t)self, 1),
         -[GEOURLPresent readAll:]((uint64_t)v4, 1),
         items = self->_items,
         !((unint64_t)items | v4[2]))
     || -[NSMutableArray isEqual:](items, "isEqual:")))
  {
    options = self->_options;
    if ((unint64_t)options | v4[3]) {
      char v7 = -[GEOURLOptions isEqual:](options, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  -[GEOURLPresent readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_items hash];
  return [(GEOURLOptions *)self->_options hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOURLPresent)initWithOptions:(id)a3
{
  id v4 = (GEOURLOptions *)a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOURLPresent;
  id v5 = [(GEOURLPresent *)&v11 init];
  if (v5)
  {
    id v6 = v4;
    char v7 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v8 = [v7 bundleIdentifier];

    id v4 = v6;
    if (v8)
    {
      id v4 = v6;
      if (!v6) {
        id v4 = objc_alloc_init(GEOURLOptions);
      }
      if (![(GEOURLOptions *)v4 hasReferralIdentifier]) {
        [(GEOURLOptions *)v4 setReferralIdentifier:v8];
      }
    }

    if ([(GEOURLOptions *)v4 hasCamera] && [(GEOURLOptions *)v4 hasCenterSpan]) {
      [(GEOURLOptions *)v4 setCenterSpan:0];
    }
    -[GEOURLPresent setOptions:]((uint64_t)v5, v4);
    uint64_t v9 = v5;
  }

  return v5;
}

- (GEOURLPresent)initWithDirectionsOptions:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (![v4 hasTransportType] || objc_msgSend(v5, "transportType") == 4) {
      [v5 setTransportType:0];
    }
    id v6 = [(GEOURLPresent *)self initWithOptions:v5];
  }
  else
  {
    char v7 = objc_alloc_init(GEOURLOptions);
    [(GEOURLOptions *)v7 setTransportType:0];
    id v6 = [(GEOURLPresent *)self initWithOptions:v7];
  }
  return v6;
}

@end