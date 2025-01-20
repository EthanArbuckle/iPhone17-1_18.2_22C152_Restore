@interface GEOPDSearchKeyValuePairList
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)addPairs:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchKeyValuePairList

- (void)addPairs:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchKeyValuePairList;
  v4 = [(GEOPDSearchKeyValuePairList *)&v8 description];
  id v5 = [(GEOPDSearchKeyValuePairList *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchKeyValuePairList _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 8) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v6 = *(id *)(a1 + 8);
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

      [v4 setObject:v5 forKey:@"pairs"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchKeyValuePairList _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"pairs"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v5 = v4;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v16;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v5);
              }
              v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v11 = [GEOPDSearchKeyValuePair alloc];
                if (v11) {
                  v12 = (void *)-[GEOPDSearchKeyValuePair _initWithDictionary:isJSON:]((uint64_t)v11, v10);
                }
                else {
                  v12 = 0;
                }
                -[GEOPDSearchKeyValuePairList addPairs:]((uint64_t)a1, v12);
              }
              ++v9;
            }
            while (v7 != v9);
            uint64_t v13 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
            uint64_t v7 = v13;
          }
          while (v13);
        }
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchKeyValuePairListReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_pairs;
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_pairs;
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
        -[GEOPDSearchKeyValuePairList addPairs:]((uint64_t)v5, v11);

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
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    pairs = self->_pairs;
    if ((unint64_t)pairs | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](pairs, "isEqual:");
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
  return [(NSMutableArray *)self->_pairs hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = *(id *)(a2 + 8);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[GEOPDSearchKeyValuePairList addPairs:](a1, *(void **)(*((void *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void).cxx_destruct
{
}

@end