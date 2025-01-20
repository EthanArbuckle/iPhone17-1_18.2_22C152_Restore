@interface GEOPDScorecardLayout
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDScorecardLayout)init;
- (GEOPDScorecardLayout)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)ratingCategorys;
- (id)version;
- (unint64_t)hash;
- (void)_addNoFlagsRatingCategory:(uint64_t)a1;
- (void)_readRatingCategorys;
- (void)_readVersion;
- (void)addRatingCategory:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setVersion:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDScorecardLayout

- (GEOPDScorecardLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDScorecardLayout;
  v2 = [(GEOPDScorecardLayout *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDScorecardLayout)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDScorecardLayout;
  v3 = [(GEOPDScorecardLayout *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVersion
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
        GEOPDScorecardLayoutReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVersion_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (id)version
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDScorecardLayout _readVersion]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setVersion:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 44) |= 2u;
  *(unsigned char *)(a1 + 44) |= 4u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)_readRatingCategorys
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
        GEOPDScorecardLayoutReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRatingCategorys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (id)ratingCategorys
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDScorecardLayout _readRatingCategorys]((uint64_t)a1);
    a1 = (id *)v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addRatingCategory:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDScorecardLayout _readRatingCategorys](a1);
    -[GEOPDScorecardLayout _addNoFlagsRatingCategory:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 44) |= 1u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    *(unsigned char *)(a1 + 44) |= 4u;
  }
}

- (void)_addNoFlagsRatingCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDScorecardLayout;
  id v4 = [(GEOPDScorecardLayout *)&v8 description];
  id v5 = [(GEOPDScorecardLayout *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDScorecardLayout _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDScorecardLayout readAll:]((uint64_t)a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDScorecardLayout version](a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"version"];
    }

    if ([a1[2] count])
    {
      objc_super v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = a1[2];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = objc_msgSend(v12, "dictionaryRepresentation", (void)v16);
            }
            objc_msgSend(v6, "addObject:", v13, (void)v16);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }

      if (a2) {
        v14 = @"ratingCategory";
      }
      else {
        v14 = @"rating_category";
      }
      objc_msgSend(v4, "setObject:forKey:", v6, v14, (void)v16);
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
  return -[GEOPDScorecardLayout _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_236;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_237;
      }
      GEOPDScorecardLayoutReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDScorecardLayoutCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDScorecardLayoutReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDScorecardLayoutIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
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
    -[GEOPDScorecardLayout readAll:]((uint64_t)self, 0);
    if (self->_version) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_ratingCategorys;
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
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDScorecardLayoutReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDScorecardLayout readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_version copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_ratingCategorys;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (void)v16);
        -[GEOPDScorecardLayout addRatingCategory:]((uint64_t)v5, v14);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDScorecardLayout readAll:]((uint64_t)self, 1),
         -[GEOPDScorecardLayout readAll:]((uint64_t)v4, 1),
         version = self->_version,
         !((unint64_t)version | v4[3]))
     || -[NSString isEqual:](version, "isEqual:")))
  {
    ratingCategorys = self->_ratingCategorys;
    if ((unint64_t)ratingCategorys | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](ratingCategorys, "isEqual:");
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
  -[GEOPDScorecardLayout readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_version hash];
  return [(NSMutableArray *)self->_ratingCategorys hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_ratingCategorys, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end