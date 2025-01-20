@interface GEOVLFSLAMTrack
+ (BOOL)isValid:(id)a3;
+ (Class)imagePositionsType;
- (BOOL)hasPosition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFPoint3D)position;
- (GEOVLFSLAMTrack)init;
- (GEOVLFSLAMTrack)initWithData:(id)a3;
- (GEOVLFSLAMTrack)initWithDictionary:(id)a3;
- (GEOVLFSLAMTrack)initWithJSON:(id)a3;
- (NSMutableArray)imagePositions;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imagePositionsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)descriptorsCount;
- (unint64_t)hash;
- (unint64_t)imagePositionsCount;
- (unint64_t)observationImageIndicesCount;
- (unsigned)descriptors;
- (unsigned)descriptorsAtIndex:(unint64_t)a3;
- (unsigned)observationImageIndices;
- (unsigned)observationImageIndicesAtIndex:(unint64_t)a3;
- (void)_addNoFlagsImagePositions:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDescriptors;
- (void)_readImagePositions;
- (void)_readObservationImageIndices;
- (void)_readPosition;
- (void)addDescriptors:(unsigned int)a3;
- (void)addImagePositions:(id)a3;
- (void)addObservationImageIndices:(unsigned int)a3;
- (void)clearDescriptors;
- (void)clearImagePositions;
- (void)clearObservationImageIndices;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDescriptors:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setImagePositions:(id)a3;
- (void)setObservationImageIndices:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setPosition:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFSLAMTrack

- (GEOVLFSLAMTrack)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVLFSLAMTrack;
  v2 = [(GEOVLFSLAMTrack *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFSLAMTrack)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVLFSLAMTrack;
  v3 = [(GEOVLFSLAMTrack *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLFSLAMTrack;
  [(GEOVLFSLAMTrack *)&v3 dealloc];
}

- (void)_readPosition
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSLAMTrackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPosition_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (GEOVLFPoint3D)position
{
  -[GEOVLFSLAMTrack _readPosition]((uint64_t)self);
  position = self->_position;

  return position;
}

- (void)setPosition:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (void)_readDescriptors
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSLAMTrackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDescriptors_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)descriptorsCount
{
  return self->_descriptors.count;
}

- (unsigned)descriptors
{
  return self->_descriptors.list;
}

- (void)clearDescriptors
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt32Clear();
}

- (void)addDescriptors:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unsigned)descriptorsAtIndex:(unint64_t)a3
{
  -[GEOVLFSLAMTrack _readDescriptors]((uint64_t)self);
  p_descriptors = &self->_descriptors;
  unint64_t count = self->_descriptors.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_descriptors->list[a3];
}

- (void)setDescriptors:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147400](&self->_descriptors, a3, a4);
}

- (void)_readObservationImageIndices
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSLAMTrackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readObservationImageIndices_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)observationImageIndicesCount
{
  return self->_observationImageIndices.count;
}

- (unsigned)observationImageIndices
{
  return self->_observationImageIndices.list;
}

- (void)clearObservationImageIndices
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  PBRepeatedUInt32Clear();
}

- (void)addObservationImageIndices:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unsigned)observationImageIndicesAtIndex:(unint64_t)a3
{
  -[GEOVLFSLAMTrack _readObservationImageIndices]((uint64_t)self);
  p_observationImageIndices = &self->_observationImageIndices;
  unint64_t count = self->_observationImageIndices.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_observationImageIndices->list[a3];
}

- (void)setObservationImageIndices:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;

  MEMORY[0x1F4147400](&self->_observationImageIndices, a3, a4);
}

- (void)_readImagePositions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFSLAMTrackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImagePositions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)imagePositions
{
  -[GEOVLFSLAMTrack _readImagePositions]((uint64_t)self);
  imagePositions = self->_imagePositions;

  return imagePositions;
}

- (void)setImagePositions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  imagePositions = self->_imagePositions;
  self->_imagePositions = v4;
}

- (void)clearImagePositions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  imagePositions = self->_imagePositions;

  [(NSMutableArray *)imagePositions removeAllObjects];
}

- (void)addImagePositions:(id)a3
{
  id v4 = a3;
  -[GEOVLFSLAMTrack _readImagePositions]((uint64_t)self);
  -[GEOVLFSLAMTrack _addNoFlagsImagePositions:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsImagePositions:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)imagePositionsCount
{
  -[GEOVLFSLAMTrack _readImagePositions]((uint64_t)self);
  imagePositions = self->_imagePositions;

  return [(NSMutableArray *)imagePositions count];
}

- (id)imagePositionsAtIndex:(unint64_t)a3
{
  -[GEOVLFSLAMTrack _readImagePositions]((uint64_t)self);
  imagePositions = self->_imagePositions;

  return (id)[(NSMutableArray *)imagePositions objectAtIndex:a3];
}

+ (Class)imagePositionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFSLAMTrack;
  id v4 = [(GEOVLFSLAMTrack *)&v8 description];
  id v5 = [(GEOVLFSLAMTrack *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFSLAMTrack _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 position];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"position"];
    }
    if (*(void *)(a1 + 24))
    {
      objc_super v8 = PBRepeatedUInt32NSArray();
      [v4 setObject:v8 forKey:@"descriptors"];
    }
    if (*(void *)(a1 + 48))
    {
      v9 = PBRepeatedUInt32NSArray();
      if (a2) {
        v10 = @"observationImageIndices";
      }
      else {
        v10 = @"observation_image_indices";
      }
      [v4 setObject:v9 forKey:v10];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = *(id *)(a1 + 64);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            v18 = objc_msgSend(v17, "dictionaryRepresentation", (void)v21);
            }
            objc_msgSend(v11, "addObject:", v18, (void)v21);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }

      if (a2) {
        v19 = @"imagePositions";
      }
      else {
        v19 = @"image_positions";
      }
      objc_msgSend(v4, "setObject:forKey:", v11, v19, (void)v21);
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
  return -[GEOVLFSLAMTrack _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFSLAMTrack)initWithDictionary:(id)a3
{
  return (GEOVLFSLAMTrack *)-[GEOVLFSLAMTrack _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"position"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [GEOVLFPoint3D alloc];
        if (a3) {
          uint64_t v8 = [(GEOVLFPoint3D *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOVLFPoint3D *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setPosition:v8];
      }
      v10 = [v5 objectForKeyedSubscript:@"descriptors"];
      objc_opt_class();
      id v37 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v47 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addDescriptors:", objc_msgSend(v16, "unsignedIntValue"));
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v46 objects:v52 count:16];
          }
          while (v13);
        }

        id v5 = v37;
      }

      if (a3) {
        v17 = @"observationImageIndices";
      }
      else {
        v17 = @"observation_image_indices";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v43 != v22) {
                objc_enumerationMutation(v19);
              }
              long long v24 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addObservationImageIndices:", objc_msgSend(v24, "unsignedIntValue"));
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v21);
        }

        id v5 = v37;
      }

      if (a3) {
        v25 = @"imagePositions";
      }
      else {
        v25 = @"image_positions";
      }
      uint64_t v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v27 = v26;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v39;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v38 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v33 = [GEOVLFImagePosition alloc];
                if (a3) {
                  uint64_t v34 = [(GEOVLFImagePosition *)v33 initWithJSON:v32];
                }
                else {
                  uint64_t v34 = [(GEOVLFImagePosition *)v33 initWithDictionary:v32];
                }
                v35 = (void *)v34;
                [a1 addImagePositions:v34];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v50 count:16];
          }
          while (v29);
        }

        id v5 = v37;
      }
    }
  }

  return a1;
}

- (GEOVLFSLAMTrack)initWithJSON:(id)a3
{
  return (GEOVLFSLAMTrack *)-[GEOVLFSLAMTrack _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_12179;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_12180;
    }
    GEOVLFSLAMTrackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOVLFSLAMTrackCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFSLAMTrackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFSLAMTrackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1F) == 0))
  {
    uint64_t v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVLFSLAMTrack *)self readAll:0];
    if (self->_position) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_descriptors.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_descriptors.count);
    }
    if (self->_observationImageIndices.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_observationImageIndices.count);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = self->_imagePositions;
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
          PBDataWriterWriteSubmessage();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)copyTo:(id)a3
{
  long long v14 = (id *)a3;
  [(GEOVLFSLAMTrack *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v14 + 1, self->_reader);
  *((_DWORD *)v14 + 20) = self->_readerMarkPos;
  *((_DWORD *)v14 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_position) {
    objc_msgSend(v14, "setPosition:");
  }
  if ([(GEOVLFSLAMTrack *)self descriptorsCount])
  {
    [v14 clearDescriptors];
    unint64_t v4 = [(GEOVLFSLAMTrack *)self descriptorsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v14, "addDescriptors:", -[GEOVLFSLAMTrack descriptorsAtIndex:](self, "descriptorsAtIndex:", i));
    }
  }
  if ([(GEOVLFSLAMTrack *)self observationImageIndicesCount])
  {
    [v14 clearObservationImageIndices];
    unint64_t v7 = [(GEOVLFSLAMTrack *)self observationImageIndicesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v14, "addObservationImageIndices:", -[GEOVLFSLAMTrack observationImageIndicesAtIndex:](self, "observationImageIndicesAtIndex:", j));
    }
  }
  if ([(GEOVLFSLAMTrack *)self imagePositionsCount])
  {
    [v14 clearImagePositions];
    unint64_t v10 = [(GEOVLFSLAMTrack *)self imagePositionsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
      {
        uint64_t v13 = [(GEOVLFSLAMTrack *)self imagePositionsAtIndex:k];
        [v14 addImagePositions:v13];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOVLFSLAMTrackReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVLFSLAMTrack *)self readAll:0];
  id v8 = [(GEOVLFPoint3D *)self->_position copyWithZone:a3];
  uint64_t v9 = (void *)v5[9];
  v5[9] = v8;

  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v10 = self->_imagePositions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [v5 addImagePositions:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOVLFSLAMTrack *)self readAll:1],
         [v4 readAll:1],
         position = self->_position,
         !((unint64_t)position | v4[9]))
     || -[GEOVLFPoint3D isEqual:](position, "isEqual:"))
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual())
  {
    imagePositions = self->_imagePositions;
    if ((unint64_t)imagePositions | v4[8]) {
      char v7 = -[NSMutableArray isEqual:](imagePositions, "isEqual:");
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
  [(GEOVLFSLAMTrack *)self readAll:1];
  unint64_t v3 = [(GEOVLFPoint3D *)self->_position hash];
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = v4 ^ PBRepeatedUInt32Hash() ^ v3;
  return v5 ^ [(NSMutableArray *)self->_imagePositions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  [v4 readAll:0];
  position = self->_position;
  id v6 = v4[9];
  if (position)
  {
    if (v6) {
      -[GEOVLFPoint3D mergeFrom:](position, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOVLFSLAMTrack setPosition:](self, "setPosition:");
  }
  uint64_t v7 = [v4 descriptorsCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
      -[GEOVLFSLAMTrack addDescriptors:](self, "addDescriptors:", [v4 descriptorsAtIndex:i]);
  }
  uint64_t v10 = [v4 observationImageIndicesCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[GEOVLFSLAMTrack addObservationImageIndices:](self, "addObservationImageIndices:", [v4 observationImageIndicesAtIndex:j]);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v4[8];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOVLFSLAMTrack addImagePositions:](self, "addImagePositions:", *(void *)(*((void *)&v18 + 1) + 8 * k), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_imagePositions, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end