@interface GEOLogMsgEventNetworkEventSummary
+ (BOOL)isValid:(id)a3;
+ (Class)groupsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventNetworkEventSummary)initWithDictionary:(id)a3;
- (GEOLogMsgEventNetworkEventSummary)initWithJSON:(id)a3;
- (NSMutableArray)groups;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupsAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)groupsCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addGroups:(id)a3;
- (void)clearGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGroups:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventNetworkEventSummary

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
  v8.super_class = (Class)GEOLogMsgEventNetworkEventSummary;
  id v4 = [(GEOLogMsgEventNetworkEventSummary *)&v8 description];
  v5 = [(GEOLogMsgEventNetworkEventSummary *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventNetworkEventSummary _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
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

      [v4 setObject:v5 forKey:@"groups"];
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
  return -[GEOLogMsgEventNetworkEventSummary _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOLogMsgEventNetworkEventSummary)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventNetworkEventSummary *)-[GEOLogMsgEventNetworkEventSummary _initWithDictionary:isJSON:](self, a3, 0);
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
      id v6 = [v5 objectForKeyedSubscript:@"groups"];
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
                v13 = [GEONetEventDimensionalGrouping alloc];
                if (a3) {
                  uint64_t v14 = [(GEONetEventDimensionalGrouping *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEONetEventDimensionalGrouping *)v13 initWithDictionary:v12];
                }
                long long v15 = (void *)v14;
                [a1 addGroups:v14];
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

- (GEOLogMsgEventNetworkEventSummary)initWithJSON:(id)a3
{
  return (GEOLogMsgEventNetworkEventSummary *)-[GEOLogMsgEventNetworkEventSummary _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventNetworkEventSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventNetworkEventSummaryReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
  id v8 = a3;
  [(GEOLogMsgEventNetworkEventSummary *)self readAll:0];
  if ([(GEOLogMsgEventNetworkEventSummary *)self groupsCount])
  {
    [v8 clearGroups];
    unint64_t v4 = [(GEOLogMsgEventNetworkEventSummary *)self groupsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLogMsgEventNetworkEventSummary *)self groupsAtIndex:i];
        [v8 addGroups:v7];
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
  uint64_t v6 = self->_groups;
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
        [v5 addGroups:v11];

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
    [(GEOLogMsgEventNetworkEventSummary *)self readAll:1];
    [v4 readAll:1];
    groups = self->_groups;
    if ((unint64_t)groups | v4[1]) {
      char v5 = -[NSMutableArray isEqual:](groups, "isEqual:");
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
  [(GEOLogMsgEventNetworkEventSummary *)self readAll:1];
  groups = self->_groups;

  return [(NSMutableArray *)groups hash];
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
        -[GEOLogMsgEventNetworkEventSummary addGroups:](self, "addGroups:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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