@interface GEOLogMsgEventMapKitCounts
+ (BOOL)isValid:(id)a3;
+ (Class)mapKitCountsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventMapKitCounts)initWithDictionary:(id)a3;
- (GEOLogMsgEventMapKitCounts)initWithJSON:(id)a3;
- (NSMutableArray)mapKitCounts;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapKitCountsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mapKitCountsCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addMapKitCounts:(id)a3;
- (void)clearMapKitCounts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMapKitCounts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventMapKitCounts

- (NSMutableArray)mapKitCounts
{
  return self->_mapKitCounts;
}

- (void)setMapKitCounts:(id)a3
{
}

- (void)clearMapKitCounts
{
}

- (void)addMapKitCounts:(id)a3
{
  id v4 = a3;
  mapKitCounts = self->_mapKitCounts;
  id v8 = v4;
  if (!mapKitCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_mapKitCounts;
    self->_mapKitCounts = v6;

    id v4 = v8;
    mapKitCounts = self->_mapKitCounts;
  }
  [(NSMutableArray *)mapKitCounts addObject:v4];
}

- (unint64_t)mapKitCountsCount
{
  return [(NSMutableArray *)self->_mapKitCounts count];
}

- (id)mapKitCountsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mapKitCounts objectAtIndex:a3];
}

+ (Class)mapKitCountsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventMapKitCounts;
  id v4 = [(GEOLogMsgEventMapKitCounts *)&v8 description];
  v5 = [(GEOLogMsgEventMapKitCounts *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventMapKitCounts _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([a1[1] count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = a1[1];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v15);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v15);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"mapKitCounts";
      }
      else {
        v13 = @"map_kit_counts";
      }
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v15);
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
  return -[GEOLogMsgEventMapKitCounts _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLogMsgEventMapKitCounts)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventMapKitCounts *)-[GEOLogMsgEventMapKitCounts _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"mapKitCounts";
      }
      else {
        id v6 = @"map_kit_counts";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v5;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOMapKitCount alloc];
                if (a3) {
                  uint64_t v15 = [(GEOMapKitCount *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEOMapKitCount *)v14 initWithDictionary:v13];
                }
                long long v16 = (void *)v15;
                [a1 addMapKitCounts:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v10);
        }

        id v5 = v18;
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventMapKitCounts)initWithJSON:(id)a3
{
  return (GEOLogMsgEventMapKitCounts *)-[GEOLogMsgEventMapKitCounts _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventMapKitCountsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventMapKitCountsReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_mapKitCounts;
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
  [(GEOLogMsgEventMapKitCounts *)self readAll:0];
  if ([(GEOLogMsgEventMapKitCounts *)self mapKitCountsCount])
  {
    [v8 clearMapKitCounts];
    unint64_t v4 = [(GEOLogMsgEventMapKitCounts *)self mapKitCountsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventMapKitCounts *)self mapKitCountsAtIndex:i];
        [v8 addMapKitCounts:v7];
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
  uint64_t v6 = self->_mapKitCounts;
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
        [v5 addMapKitCounts:v11];

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
    [(GEOLogMsgEventMapKitCounts *)self readAll:1];
    [v4 readAll:1];
    mapKitCounts = self->_mapKitCounts;
    if ((unint64_t)mapKitCounts | v4[1]) {
      char v5 = -[NSMutableArray isEqual:](mapKitCounts, "isEqual:");
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
  [(GEOLogMsgEventMapKitCounts *)self readAll:1];
  mapKitCounts = self->_mapKitCounts;

  return [(NSMutableArray *)mapKitCounts hash];
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
        -[GEOLogMsgEventMapKitCounts addMapKitCounts:](self, "addMapKitCounts:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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