@interface GEOLogMsgStateTileSet
+ (BOOL)isValid:(id)a3;
+ (Class)tileSetInfoType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateTileSet)initWithDictionary:(id)a3;
- (GEOLogMsgStateTileSet)initWithJSON:(id)a3;
- (NSMutableArray)tileSetInfos;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)tileSetInfoAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tileSetInfosCount;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addTileSetInfo:(id)a3;
- (void)clearTileSetInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTileSetInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateTileSet

- (NSMutableArray)tileSetInfos
{
  return self->_tileSetInfos;
}

- (void)setTileSetInfos:(id)a3
{
}

- (void)clearTileSetInfos
{
}

- (void)addTileSetInfo:(id)a3
{
  id v4 = a3;
  tileSetInfos = self->_tileSetInfos;
  id v8 = v4;
  if (!tileSetInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_tileSetInfos;
    self->_tileSetInfos = v6;

    id v4 = v8;
    tileSetInfos = self->_tileSetInfos;
  }
  [(NSMutableArray *)tileSetInfos addObject:v4];
}

- (unint64_t)tileSetInfosCount
{
  return [(NSMutableArray *)self->_tileSetInfos count];
}

- (id)tileSetInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tileSetInfos objectAtIndex:a3];
}

+ (Class)tileSetInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateTileSet;
  id v4 = [(GEOLogMsgStateTileSet *)&v8 description];
  v5 = [(GEOLogMsgStateTileSet *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateTileSet _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
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

      [v4 setObject:v5 forKey:@"tileSetInfo"];
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
  return -[GEOLogMsgStateTileSet _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLogMsgStateTileSet)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateTileSet *)-[GEOLogMsgStateTileSet _initWithDictionary:isJSON:](self, a3, 0);
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
      id v6 = [v5 objectForKeyedSubscript:@"tileSetInfo"];
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
                v13 = [GEOTileSetInfo alloc];
                if (a3) {
                  uint64_t v14 = [(GEOTileSetInfo *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOTileSetInfo *)v13 initWithDictionary:v12];
                }
                long long v15 = (void *)v14;
                [a1 addTileSetInfo:v14];
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

- (GEOLogMsgStateTileSet)initWithJSON:(id)a3
{
  return (GEOLogMsgStateTileSet *)-[GEOLogMsgStateTileSet _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateTileSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateTileSetReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_tileSetInfos;
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
  [(GEOLogMsgStateTileSet *)self readAll:0];
  if ([(GEOLogMsgStateTileSet *)self tileSetInfosCount])
  {
    [v8 clearTileSetInfos];
    unint64_t v4 = [(GEOLogMsgStateTileSet *)self tileSetInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgStateTileSet *)self tileSetInfoAtIndex:i];
        [v8 addTileSetInfo:v7];
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
  uint64_t v6 = self->_tileSetInfos;
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
        [v5 addTileSetInfo:v11];

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
    [(GEOLogMsgStateTileSet *)self readAll:1];
    [v4 readAll:1];
    tileSetInfos = self->_tileSetInfos;
    if ((unint64_t)tileSetInfos | v4[1]) {
      char v5 = -[NSMutableArray isEqual:](tileSetInfos, "isEqual:");
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
  [(GEOLogMsgStateTileSet *)self readAll:1];
  tileSetInfos = self->_tileSetInfos;

  return [(NSMutableArray *)tileSetInfos hash];
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
        -[GEOLogMsgStateTileSet addTileSetInfo:](self, "addTileSetInfo:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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