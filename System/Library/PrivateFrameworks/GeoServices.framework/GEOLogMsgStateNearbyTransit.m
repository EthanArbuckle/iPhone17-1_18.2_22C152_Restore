@interface GEOLogMsgStateNearbyTransit
+ (BOOL)isValid:(id)a3;
+ (Class)groupsType;
- (BOOL)hasPinnedLines;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateNearbyTransit)initWithDictionary:(id)a3;
- (GEOLogMsgStateNearbyTransit)initWithJSON:(id)a3;
- (NSMutableArray)groups;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)groupsCount;
- (unint64_t)hash;
- (unsigned)pinnedLines;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addGroups:(id)a3;
- (void)clearGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGroups:(id)a3;
- (void)setHasPinnedLines:(BOOL)a3;
- (void)setPinnedLines:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateNearbyTransit

- (unsigned)pinnedLines
{
  return self->_pinnedLines;
}

- (void)setPinnedLines:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_pinnedLines = a3;
}

- (void)setHasPinnedLines:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPinnedLines
{
  return *(unsigned char *)&self->_flags & 1;
}

- (NSMutableArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (void)clearGroups
{
}

- (void)addGroups:(id)a3
{
  id v4 = a3;
  groups = self->_groups;
  id v8 = v4;
  if (!groups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_groups;
    self->_groups = v6;

    id v4 = v8;
    groups = self->_groups;
  }
  [(NSMutableArray *)groups addObject:v4];
}

- (unint64_t)groupsCount
{
  return [(NSMutableArray *)self->_groups count];
}

- (id)groupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_groups objectAtIndex:a3];
}

+ (Class)groupsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateNearbyTransit;
  id v4 = [(GEOLogMsgStateNearbyTransit *)&v8 description];
  v5 = [(GEOLogMsgStateNearbyTransit *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateNearbyTransit _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v6 = @"pinnedLines";
      }
      else {
        v6 = @"pinned_lines";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 8) count])
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = *(id *)(a1 + 8);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v16);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v16);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"groups"];
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
  return -[GEOLogMsgStateNearbyTransit _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateNearbyTransit)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateNearbyTransit *)-[GEOLogMsgStateNearbyTransit _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"pinnedLines";
      }
      else {
        v6 = @"pinned_lines";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPinnedLines:", objc_msgSend(v7, "unsignedIntValue"));
      }

      id v8 = [v5 objectForKeyedSubscript:@"groups"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v19 = v8;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v15 = [GEONearbyTransitGroup alloc];
                if (a3) {
                  uint64_t v16 = [(GEONearbyTransitGroup *)v15 initWithJSON:v14];
                }
                else {
                  uint64_t v16 = [(GEONearbyTransitGroup *)v15 initWithDictionary:v14];
                }
                long long v17 = (void *)v16;
                [a1 addGroups:v16];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v11);
        }

        id v8 = v19;
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateNearbyTransit)initWithJSON:(id)a3
{
  return (GEOLogMsgStateNearbyTransit *)-[GEOLogMsgStateNearbyTransit _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateNearbyTransitIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateNearbyTransitReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_groups;
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
  uint64_t v8 = a3;
  [(GEOLogMsgStateNearbyTransit *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v8[4] = self->_pinnedLines;
    *((unsigned char *)v8 + 20) |= 1u;
  }
  if ([(GEOLogMsgStateNearbyTransit *)self groupsCount])
  {
    [v8 clearGroups];
    unint64_t v4 = [(GEOLogMsgStateNearbyTransit *)self groupsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgStateNearbyTransit *)self groupsAtIndex:i];
        [v8 addGroups:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_pinnedLines;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_groups;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addGroups:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEOLogMsgStateNearbyTransit *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_pinnedLines != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  groups = self->_groups;
  if ((unint64_t)groups | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](groups, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateNearbyTransit *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_pinnedLines;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSMutableArray *)self->_groups hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 20))
  {
    self->_pinnedLines = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[GEOLogMsgStateNearbyTransit addGroups:](self, "addGroups:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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