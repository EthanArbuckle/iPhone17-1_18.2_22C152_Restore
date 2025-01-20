@interface GEOCoarseLocationTileData
+ (BOOL)isValid:(id)a3;
+ (Class)territoryType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCoarseLocationTileData)initWithDictionary:(id)a3;
- (GEOCoarseLocationTileData)initWithJSON:(id)a3;
- (NSMutableArray)territorys;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)territoryAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)territorysCount;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addTerritory:(id)a3;
- (void)clearTerritorys;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTerritorys:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOCoarseLocationTileData

- (NSMutableArray)territorys
{
  return self->_territorys;
}

- (void)setTerritorys:(id)a3
{
}

- (void)clearTerritorys
{
}

- (void)addTerritory:(id)a3
{
  id v4 = a3;
  territorys = self->_territorys;
  id v8 = v4;
  if (!territorys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_territorys;
    self->_territorys = v6;

    id v4 = v8;
    territorys = self->_territorys;
  }
  [(NSMutableArray *)territorys addObject:v4];
}

- (unint64_t)territorysCount
{
  return [(NSMutableArray *)self->_territorys count];
}

- (id)territoryAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_territorys objectAtIndex:a3];
}

+ (Class)territoryType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOCoarseLocationTileData;
  id v4 = [(GEOCoarseLocationTileData *)&v8 description];
  v5 = [(GEOCoarseLocationTileData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCoarseLocationTileData _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[1] count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = a1[1];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v14);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v14);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"territory"];
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
  return -[GEOCoarseLocationTileData _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOCoarseLocationTileData)initWithDictionary:(id)a3
{
  return (GEOCoarseLocationTileData *)-[GEOCoarseLocationTileData _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"territory"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v17 = v6;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v19 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEOCoarseLocationTerritoryInfo alloc];
                if (a3) {
                  uint64_t v14 = [(GEOCoarseLocationTerritoryInfo *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOCoarseLocationTerritoryInfo *)v13 initWithDictionary:v12];
                }
                long long v15 = (void *)v14;
                [a1 addTerritory:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v9);
        }

        id v6 = v17;
      }
    }
  }

  return a1;
}

- (GEOCoarseLocationTileData)initWithJSON:(id)a3
{
  return (GEOCoarseLocationTileData *)-[GEOCoarseLocationTileData _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCoarseLocationTileDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCoarseLocationTileDataReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_territorys;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEOCoarseLocationTileData *)self readAll:0];
  if ([(GEOCoarseLocationTileData *)self territorysCount])
  {
    [v8 clearTerritorys];
    unint64_t v4 = [(GEOCoarseLocationTileData *)self territorysCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOCoarseLocationTileData *)self territoryAtIndex:i];
        [v8 addTerritory:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_territorys;
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
        [v5 addTerritory:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOCoarseLocationTileData *)self readAll:1];
    [v4 readAll:1];
    territorys = self->_territorys;
    if ((unint64_t)territorys | v4[1]) {
      char v5 = -[NSMutableArray isEqual:](territorys, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOCoarseLocationTileData *)self readAll:1];
  territorys = self->_territorys;

  return [(NSMutableArray *)territorys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[GEOCoarseLocationTileData addTerritory:](self, "addTerritory:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end