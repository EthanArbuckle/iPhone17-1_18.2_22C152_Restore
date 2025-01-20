@interface GEORPPoiEnrichment
+ (BOOL)isValid:(id)a3;
+ (Class)imageType;
- (BOOL)hasScorecard;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPPoiEnrichment)init;
- (GEORPPoiEnrichment)initWithData:(id)a3;
- (GEORPPoiEnrichment)initWithDictionary:(id)a3;
- (GEORPPoiEnrichment)initWithJSON:(id)a3;
- (GEORPScorecard)scorecard;
- (NSMutableArray)images;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)imageAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)imagesCount;
- (void)_addNoFlagsImage:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readImages;
- (void)_readScorecard;
- (void)addImage:(id)a3;
- (void)clearImages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setImages:(id)a3;
- (void)setScorecard:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPoiEnrichment

- (GEORPPoiEnrichment)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiEnrichment;
  v2 = [(GEORPPoiEnrichment *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiEnrichment)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiEnrichment;
  v3 = [(GEORPPoiEnrichment *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readScorecard
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
        GEORPPoiEnrichmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readScorecard_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasScorecard
{
  return self->_scorecard != 0;
}

- (GEORPScorecard)scorecard
{
  -[GEORPPoiEnrichment _readScorecard]((uint64_t)self);
  scorecard = self->_scorecard;

  return scorecard;
}

- (void)setScorecard:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_scorecard, a3);
}

- (void)_readImages
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
        GEORPPoiEnrichmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (NSMutableArray)images
{
  -[GEORPPoiEnrichment _readImages]((uint64_t)self);
  images = self->_images;

  return images;
}

- (void)setImages:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  images = self->_images;
  self->_images = v4;
}

- (void)clearImages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
  images = self->_images;

  [(NSMutableArray *)images removeAllObjects];
}

- (void)addImage:(id)a3
{
  id v4 = a3;
  -[GEORPPoiEnrichment _readImages]((uint64_t)self);
  -[GEORPPoiEnrichment _addNoFlagsImage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 4u;
}

- (void)_addNoFlagsImage:(uint64_t)a1
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

- (unint64_t)imagesCount
{
  -[GEORPPoiEnrichment _readImages]((uint64_t)self);
  images = self->_images;

  return [(NSMutableArray *)images count];
}

- (id)imageAtIndex:(unint64_t)a3
{
  -[GEORPPoiEnrichment _readImages]((uint64_t)self);
  images = self->_images;

  return (id)[(NSMutableArray *)images objectAtIndex:a3];
}

+ (Class)imageType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPoiEnrichment;
  id v4 = [(GEORPPoiEnrichment *)&v8 description];
  id v5 = [(GEORPPoiEnrichment *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiEnrichment _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 scorecard];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"scorecard"];
    }
    if ([a1[2] count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = a1[2];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = objc_msgSend(v14, "dictionaryRepresentation", (void)v17);
            }
            objc_msgSend(v8, "addObject:", v15, (void)v17);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"image"];
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
  return -[GEORPPoiEnrichment _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPPoiEnrichment)initWithDictionary:(id)a3
{
  return (GEORPPoiEnrichment *)-[GEORPPoiEnrichment _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"scorecard"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [GEORPScorecard alloc];
        if (a3) {
          uint64_t v8 = [(GEORPScorecard *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEORPScorecard *)v7 initWithDictionary:v6];
        }
        id v9 = (void *)v8;
        [a1 setScorecard:v8];
      }
      uint64_t v10 = [v5 objectForKeyedSubscript:@"image"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v5;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v17 = [GEORPEnrichmentImage alloc];
                if (a3) {
                  uint64_t v18 = [(GEORPEnrichmentImage *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEORPEnrichmentImage *)v17 initWithDictionary:v16];
                }
                long long v19 = (void *)v18;
                [a1 addImage:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v13);
        }

        id v5 = v21;
      }
    }
  }

  return a1;
}

- (GEORPPoiEnrichment)initWithJSON:(id)a3
{
  return (GEORPPoiEnrichment *)-[GEORPPoiEnrichment _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_178_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_179_0;
    }
    GEORPPoiEnrichmentReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPPoiEnrichmentCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiEnrichmentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiEnrichmentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPPoiEnrichmentIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPPoiEnrichment *)self readAll:0];
    if (self->_scorecard) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_images;
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

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPPoiEnrichment *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 8) = self->_readerMarkPos;
  *((_DWORD *)v8 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_scorecard) {
    objc_msgSend(v8, "setScorecard:");
  }
  if ([(GEORPPoiEnrichment *)self imagesCount])
  {
    [v8 clearImages];
    unint64_t v4 = [(GEORPPoiEnrichment *)self imagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPPoiEnrichment *)self imageAtIndex:i];
        [v8 addImage:v7];
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
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPPoiEnrichmentReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPPoiEnrichment *)self readAll:0];
  id v8 = [(GEORPScorecard *)self->_scorecard copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_images;
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
        [v5 addImage:v14];

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
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPPoiEnrichment *)self readAll:1],
         [v4 readAll:1],
         scorecard = self->_scorecard,
         !((unint64_t)scorecard | v4[3]))
     || -[GEORPScorecard isEqual:](scorecard, "isEqual:")))
  {
    images = self->_images;
    if ((unint64_t)images | v4[2]) {
      char v7 = -[NSMutableArray isEqual:](images, "isEqual:");
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
  [(GEORPPoiEnrichment *)self readAll:1];
  unint64_t v3 = [(GEORPScorecard *)self->_scorecard hash];
  return [(NSMutableArray *)self->_images hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  scorecard = self->_scorecard;
  id v6 = v4[3];
  if (scorecard)
  {
    if (v6) {
      -[GEORPScorecard mergeFrom:](scorecard, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPPoiEnrichment setScorecard:](self, "setScorecard:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4[2];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEORPPoiEnrichment addImage:](self, "addImage:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scorecard, 0);
  objc_storeStrong((id *)&self->_images, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end