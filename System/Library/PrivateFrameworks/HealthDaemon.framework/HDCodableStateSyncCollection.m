@interface HDCodableStateSyncCollection
+ (Class)deletedSampleCollectionsType;
+ (Class)sampleCollectionsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)deletedSampleCollections;
- (NSMutableArray)sampleCollections;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deletedSampleCollectionsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sampleCollectionsAtIndex:(unint64_t)a3;
- (unint64_t)deletedSampleCollectionsCount;
- (unint64_t)hash;
- (unint64_t)sampleCollectionsCount;
- (void)addDeletedSampleCollections:(id)a3;
- (void)addSampleCollections:(id)a3;
- (void)clearDeletedSampleCollections;
- (void)clearSampleCollections;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeletedSampleCollections:(id)a3;
- (void)setSampleCollections:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableStateSyncCollection

- (void)clearSampleCollections
{
}

- (void)addSampleCollections:(id)a3
{
  id v4 = a3;
  sampleCollections = self->_sampleCollections;
  id v8 = v4;
  if (!sampleCollections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_sampleCollections;
    self->_sampleCollections = v6;

    id v4 = v8;
    sampleCollections = self->_sampleCollections;
  }
  [(NSMutableArray *)sampleCollections addObject:v4];
}

- (unint64_t)sampleCollectionsCount
{
  return [(NSMutableArray *)self->_sampleCollections count];
}

- (id)sampleCollectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sampleCollections objectAtIndex:a3];
}

+ (Class)sampleCollectionsType
{
  return (Class)objc_opt_class();
}

- (void)clearDeletedSampleCollections
{
}

- (void)addDeletedSampleCollections:(id)a3
{
  id v4 = a3;
  deletedSampleCollections = self->_deletedSampleCollections;
  id v8 = v4;
  if (!deletedSampleCollections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_deletedSampleCollections;
    self->_deletedSampleCollections = v6;

    id v4 = v8;
    deletedSampleCollections = self->_deletedSampleCollections;
  }
  [(NSMutableArray *)deletedSampleCollections addObject:v4];
}

- (unint64_t)deletedSampleCollectionsCount
{
  return [(NSMutableArray *)self->_deletedSampleCollections count];
}

- (id)deletedSampleCollectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_deletedSampleCollections objectAtIndex:a3];
}

+ (Class)deletedSampleCollectionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableStateSyncCollection;
  id v4 = [(HDCodableStateSyncCollection *)&v8 description];
  v5 = [(HDCodableStateSyncCollection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_sampleCollections count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_sampleCollections, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = self->_sampleCollections;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"sampleCollections"];
  }
  if ([(NSMutableArray *)self->_deletedSampleCollections count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_deletedSampleCollections, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = self->_deletedSampleCollections;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "dictionaryRepresentation", (void)v19);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"deletedSampleCollections"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableStateSyncCollectionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_sampleCollections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_deletedSampleCollections;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if ([(HDCodableStateSyncCollection *)self sampleCollectionsCount])
  {
    [v12 clearSampleCollections];
    unint64_t v4 = [(HDCodableStateSyncCollection *)self sampleCollectionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HDCodableStateSyncCollection *)self sampleCollectionsAtIndex:i];
        [v12 addSampleCollections:v7];
      }
    }
  }
  if ([(HDCodableStateSyncCollection *)self deletedSampleCollectionsCount])
  {
    [v12 clearDeletedSampleCollections];
    unint64_t v8 = [(HDCodableStateSyncCollection *)self deletedSampleCollectionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HDCodableStateSyncCollection *)self deletedSampleCollectionsAtIndex:j];
        [v12 addDeletedSampleCollections:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_sampleCollections;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addSampleCollections:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = self->_deletedSampleCollections;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addDeletedSampleCollections:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sampleCollections = self->_sampleCollections, !((unint64_t)sampleCollections | v4[2]))
     || -[NSMutableArray isEqual:](sampleCollections, "isEqual:")))
  {
    deletedSampleCollections = self->_deletedSampleCollections;
    if ((unint64_t)deletedSampleCollections | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](deletedSampleCollections, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_sampleCollections hash];
  return [(NSMutableArray *)self->_deletedSampleCollections hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HDCodableStateSyncCollection *)self addSampleCollections:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[HDCodableStateSyncCollection addDeletedSampleCollections:](self, "addDeletedSampleCollections:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)sampleCollections
{
  return self->_sampleCollections;
}

- (void)setSampleCollections:(id)a3
{
}

- (NSMutableArray)deletedSampleCollections
{
  return self->_deletedSampleCollections;
}

- (void)setDeletedSampleCollections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleCollections, 0);

  objc_storeStrong((id *)&self->_deletedSampleCollections, 0);
}

@end