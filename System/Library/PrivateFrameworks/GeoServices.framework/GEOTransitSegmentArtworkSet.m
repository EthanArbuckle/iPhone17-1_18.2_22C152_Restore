@interface GEOTransitSegmentArtworkSet
+ (BOOL)isValid:(id)a3;
+ (Class)clusterType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitSegmentArtworkSet)init;
- (GEOTransitSegmentArtworkSet)initWithData:(id)a3;
- (GEOTransitSegmentArtworkSet)initWithDictionary:(id)a3;
- (GEOTransitSegmentArtworkSet)initWithJSON:(id)a3;
- (NSMutableArray)clusters;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)clusterAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)artworkIndexsCount;
- (unint64_t)clustersCount;
- (unint64_t)hash;
- (unsigned)artworkIndexAtIndex:(unint64_t)a3;
- (unsigned)artworkIndexs;
- (void)_addNoFlagsCluster:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readArtworkIndexs;
- (void)_readClusters;
- (void)addArtworkIndex:(unsigned int)a3;
- (void)addCluster:(id)a3;
- (void)clearArtworkIndexs;
- (void)clearClusters;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setClusters:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitSegmentArtworkSet

- (GEOTransitSegmentArtworkSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitSegmentArtworkSet;
  v2 = [(GEOTransitSegmentArtworkSet *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitSegmentArtworkSet)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitSegmentArtworkSet;
  v3 = [(GEOTransitSegmentArtworkSet *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitSegmentArtworkSet;
  [(GEOTransitSegmentArtworkSet *)&v3 dealloc];
}

- (void)_readArtworkIndexs
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
        GEOTransitSegmentArtworkSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworkIndexs_tags_1367);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)artworkIndexsCount
{
  return self->_artworkIndexs.count;
}

- (unsigned)artworkIndexs
{
  return self->_artworkIndexs.list;
}

- (void)clearArtworkIndexs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  PBRepeatedUInt32Clear();
}

- (void)addArtworkIndex:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unsigned)artworkIndexAtIndex:(unint64_t)a3
{
  -[GEOTransitSegmentArtworkSet _readArtworkIndexs]((uint64_t)self);
  p_artworkIndexs = &self->_artworkIndexs;
  unint64_t count = self->_artworkIndexs.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_artworkIndexs->list[a3];
}

- (void)setArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;

  MEMORY[0x1F4147400](&self->_artworkIndexs, a3, a4);
}

- (void)_readClusters
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
        GEOTransitSegmentArtworkSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readClusters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)clusters
{
  -[GEOTransitSegmentArtworkSet _readClusters]((uint64_t)self);
  clusters = self->_clusters;

  return clusters;
}

- (void)setClusters:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  clusters = self->_clusters;
  self->_clusters = v4;
}

- (void)clearClusters
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  clusters = self->_clusters;

  [(NSMutableArray *)clusters removeAllObjects];
}

- (void)addCluster:(id)a3
{
  id v4 = a3;
  -[GEOTransitSegmentArtworkSet _readClusters]((uint64_t)self);
  -[GEOTransitSegmentArtworkSet _addNoFlagsCluster:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsCluster:(uint64_t)a1
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

- (unint64_t)clustersCount
{
  -[GEOTransitSegmentArtworkSet _readClusters]((uint64_t)self);
  clusters = self->_clusters;

  return [(NSMutableArray *)clusters count];
}

- (id)clusterAtIndex:(unint64_t)a3
{
  -[GEOTransitSegmentArtworkSet _readClusters]((uint64_t)self);
  clusters = self->_clusters;

  return (id)[(NSMutableArray *)clusters objectAtIndex:a3];
}

+ (Class)clusterType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitSegmentArtworkSet;
  id v4 = [(GEOTransitSegmentArtworkSet *)&v8 description];
  id v5 = [(GEOTransitSegmentArtworkSet *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitSegmentArtworkSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      id v5 = PBRepeatedUInt32NSArray();
      if (a2) {
        objc_super v6 = @"artworkIndex";
      }
      else {
        objc_super v6 = @"artwork_index";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 48) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v8 = *(id *)(a1 + 48);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"cluster"];
    }
    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __57__GEOTransitSegmentArtworkSet__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOTransitSegmentArtworkSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __57__GEOTransitSegmentArtworkSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOTransitSegmentArtworkSet)initWithDictionary:(id)a3
{
  return (GEOTransitSegmentArtworkSet *)-[GEOTransitSegmentArtworkSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"artworkIndex";
      }
      else {
        objc_super v6 = @"artwork_index";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      id v25 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v31 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addArtworkIndex:", objc_msgSend(v13, "unsignedIntValue"));
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
          }
          while (v10);
        }

        id v5 = v25;
      }

      v14 = [v5 objectForKeyedSubscript:@"cluster"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v21 = [GEOTransitClusterArtworkSet alloc];
                if (a3) {
                  uint64_t v22 = [(GEOTransitClusterArtworkSet *)v21 initWithJSON:v20];
                }
                else {
                  uint64_t v22 = [(GEOTransitClusterArtworkSet *)v21 initWithDictionary:v20];
                }
                id v23 = (void *)v22;
                [a1 addCluster:v22];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v17);
        }

        id v5 = v25;
      }
    }
  }

  return a1;
}

- (GEOTransitSegmentArtworkSet)initWithJSON:(id)a3
{
  return (GEOTransitSegmentArtworkSet *)-[GEOTransitSegmentArtworkSet _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_1372;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1373;
    }
    GEOTransitSegmentArtworkSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitSegmentArtworkSetCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitSegmentArtworkSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitSegmentArtworkSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitSegmentArtworkSetIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitSegmentArtworkSet *)self readAll:0];
    if (self->_artworkIndexs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_artworkIndexs.count);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = self->_clusters;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v11 = (id *)a3;
  [(GEOTransitSegmentArtworkSet *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 14) = self->_readerMarkPos;
  *((_DWORD *)v11 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTransitSegmentArtworkSet *)self artworkIndexsCount])
  {
    [v11 clearArtworkIndexs];
    unint64_t v4 = [(GEOTransitSegmentArtworkSet *)self artworkIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v11, "addArtworkIndex:", -[GEOTransitSegmentArtworkSet artworkIndexAtIndex:](self, "artworkIndexAtIndex:", i));
    }
  }
  if ([(GEOTransitSegmentArtworkSet *)self clustersCount])
  {
    [v11 clearClusters];
    unint64_t v7 = [(GEOTransitSegmentArtworkSet *)self clustersCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(GEOTransitSegmentArtworkSet *)self clusterAtIndex:j];
        [v11 addCluster:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEOTransitSegmentArtworkSetReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitSegmentArtworkSet *)self readAll:0];
  PBRepeatedUInt32Copy();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v8 = self->_clusters;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [v5 addCluster:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  objc_storeStrong(v5 + 2, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOTransitSegmentArtworkSet *)self readAll:1],
        [v4 readAll:1],
        PBRepeatedUInt32IsEqual()))
  {
    clusters = self->_clusters;
    if ((unint64_t)clusters | v4[6]) {
      char v6 = -[NSMutableArray isEqual:](clusters, "isEqual:");
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

- (unint64_t)hash
{
  [(GEOTransitSegmentArtworkSet *)self readAll:1];
  uint64_t v3 = PBRepeatedUInt32Hash();
  return [(NSMutableArray *)self->_clusters hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 artworkIndexsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[GEOTransitSegmentArtworkSet addArtworkIndex:](self, "addArtworkIndex:", [v4 artworkIndexAtIndex:i]);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4[6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEOTransitSegmentArtworkSet addCluster:](self, "addCluster:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTransitSegmentArtworkSetReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1377);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitSegmentArtworkSet *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v7 = self->_clusters;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusters, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end