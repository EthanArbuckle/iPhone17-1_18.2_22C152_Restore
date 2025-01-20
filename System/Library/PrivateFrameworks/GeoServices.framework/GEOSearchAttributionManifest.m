@interface GEOSearchAttributionManifest
- (BOOL)hasSourceURL;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSearchAttributionManifest)init;
- (GEOSearchAttributionManifest)initWithData:(id)a3;
- (NSString)sourceURL;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)searchAttributionSources;
- (unint64_t)hash;
- (void)_addNoFlagsActionComponentMapEntries:(uint64_t)a1;
- (void)_addNoFlagsSearchAttributionSources:(uint64_t)a1;
- (void)_readSearchAttributionSources;
- (void)_readSourceURL;
- (void)readAll:(uint64_t)a1;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSourceURL:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSearchAttributionManifest

- (id)searchAttributionSources
{
  if (a1)
  {
    v2 = a1;
    -[GEOSearchAttributionManifest _readSearchAttributionSources]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSearchAttributionSources
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
        GEOSearchAttributionManifestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchAttributionSources_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEOSearchAttributionManifest)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSearchAttributionManifest;
  id v3 = [(GEOSearchAttributionManifest *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_addNoFlagsSearchAttributionSources:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOSearchAttributionManifestReadAllFrom((uint64_t)self, a3);
}

- (GEOSearchAttributionManifest)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSearchAttributionManifest;
  v2 = [(GEOSearchAttributionManifest *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_addNoFlagsActionComponentMapEntries:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchAttributionManifest;
  v4 = [(GEOSearchAttributionManifest *)&v8 description];
  id v5 = [(GEOSearchAttributionManifest *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchAttributionManifest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOSearchAttributionManifest readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v37 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"searchAttributionSources"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v14 = *(id *)(a1 + 24);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v33;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"actionComponentMapEntries"];
    }
    if (*(unsigned char *)(a1 + 68))
    {
      v21 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      [v4 setObject:v21 forKey:@"timestamp"];
    }
    v22 = [(id)a1 sourceURL];
    if (v22) {
      [v4 setObject:v22 forKey:@"sourceURL"];
    }

    v23 = *(void **)(a1 + 16);
    if (v23)
    {
      v24 = [v23 dictionaryRepresentation];
      v25 = v24;
      if (a2)
      {
        v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __58__GEOSearchAttributionManifest__dictionaryRepresentation___block_invoke;
        v30[3] = &unk_1E53D8860;
        id v27 = v26;
        id v31 = v27;
        [v25 enumerateKeysAndObjectsUsingBlock:v30];
        id v28 = v27;

        v25 = v28;
      }
      [v4 setObject:v25 forKey:@"Unknown Fields"];
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
  return -[GEOSearchAttributionManifest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_360;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_361;
      }
      GEOSearchAttributionManifestReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = *(id *)(a1 + 32);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v7);
            }
            -[GEOSearchAttributionSource readAll:](*(void *)(*((void *)&v18 + 1) + 8 * i), 1);
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v8);
      }

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v11 = *(id *)(a1 + 24);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v15;
        while (1)
        {
          if (*(void *)v15 != v13) {
            objc_enumerationMutation(v11);
          }
          if (!--v12)
          {
            uint64_t v12 = [v11 countByEnumeratingWithState:&v14 objects:v22 count:16];
            if (!v12) {
              break;
            }
          }
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __58__GEOSearchAttributionManifest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
  {
    long long v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOSearchAttributionManifest readAll:]((uint64_t)self, 0);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_searchAttributionSources;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_actionComponentMapEntries;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteDoubleField();
    }
    if (self->_sourceURL) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v8 = self;
    uint64_t v9 = reader;
    objc_sync_enter(v9);
    if ((*(unsigned char *)&v8->_flags & 0x20) == 0)
    {
      *(void *)((char *)v8->_reader + (int)*MEMORY[0x1E4F940E0]) = v8->_readerMarkLength;
      [(PBDataReader *)v8->_reader seekToOffset:v8->_readerMarkPos];
      GEOSearchAttributionManifestReadAllFrom(v5, v8->_reader);
      os_unfair_lock_unlock(p_readerLock);
      id v10 = (id)v5;
      objc_sync_exit(v9);

      goto LABEL_29;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOSearchAttributionManifest readAll:]((uint64_t)self, 0);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v31 = self;
  uint64_t v11 = self->_searchAttributionSources;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) copyWithZone:a3];
        long long v16 = v15;
        if (v5)
        {
          id v17 = v15;
          -[GEOSearchAttributionManifest _readSearchAttributionSources](v5);
          -[GEOSearchAttributionManifest _addNoFlagsSearchAttributionSources:](v5, v17);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 68) |= 8u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 64));
          *(unsigned char *)(v5 + 68) |= 0x20u;
        }
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v12);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v31->_actionComponentMapEntries;
  uint64_t v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v34;
    long long v20 = (os_unfair_lock_s *)(v5 + 64);
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v22 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * j) copyWithZone:a3];
        long long v23 = v22;
        if (v5)
        {
          id v24 = v22;
          os_unfair_lock_lock(v20);
          if ((*(unsigned char *)(v5 + 68) & 4) == 0)
          {
            v25 = *(void **)(v5 + 8);
            if (v25)
            {
              id v26 = v25;
              objc_sync_enter(v26);
              GEOSearchAttributionManifestReadSpecified(v5, *(void *)(v5 + 8), (int *)&_readActionComponentMapEntries_tags);
              objc_sync_exit(v26);
            }
          }
          os_unfair_lock_unlock(v20);
          -[GEOSearchAttributionManifest _addNoFlagsActionComponentMapEntries:](v5, v24);

          os_unfair_lock_lock_with_options();
          *(unsigned char *)(v5 + 68) |= 4u;
          os_unfair_lock_unlock(v20);
          *(unsigned char *)(v5 + 68) |= 0x20u;
        }
      }
      uint64_t v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v18);
  }

  if (*(unsigned char *)&v31->_flags)
  {
    *(double *)(v5 + 48) = v31->_timestamp;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v27 = -[NSString copyWithZone:](v31->_sourceURL, "copyWithZone:", a3, 64);
  id v28 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v27;

  v29 = v31->_unknownFields;
  id v10 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v29;
LABEL_29:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  -[GEOSearchAttributionManifest readAll:]((uint64_t)self, 1);
  -[GEOSearchAttributionManifest readAll:]((uint64_t)v4, 1);
  searchAttributionSources = self->_searchAttributionSources;
  if ((unint64_t)searchAttributionSources | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](searchAttributionSources, "isEqual:")) {
      goto LABEL_13;
    }
  }
  actionComponentMapEntries = self->_actionComponentMapEntries;
  if ((unint64_t)actionComponentMapEntries | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](actionComponentMapEntries, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_timestamp != *((double *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  sourceURL = self->_sourceURL;
  if ((unint64_t)sourceURL | *((void *)v4 + 5)) {
    char v8 = -[NSString isEqual:](sourceURL, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  -[GEOSearchAttributionManifest readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_searchAttributionSources hash];
  uint64_t v4 = [(NSMutableArray *)self->_actionComponentMapEntries hash];
  if (*(unsigned char *)&self->_flags)
  {
    double timestamp = self->_timestamp;
    double v7 = -timestamp;
    if (timestamp >= 0.0) {
      double v7 = self->_timestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_sourceURL hash];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_double timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readSourceURL
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
        GEOSearchAttributionManifestReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceURL_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasSourceURL
{
  return self->_sourceURL != 0;
}

- (NSString)sourceURL
{
  -[GEOSearchAttributionManifest _readSourceURL]((uint64_t)self);
  sourceURL = self->_sourceURL;

  return sourceURL;
}

- (void)setSourceURL:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_sourceURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_searchAttributionSources, 0);
  objc_storeStrong((id *)&self->_actionComponentMapEntries, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end