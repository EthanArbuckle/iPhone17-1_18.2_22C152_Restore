@interface GEOPDSearchQueryTokenImportanceMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)addTokenImportance:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchQueryTokenImportanceMetadata

- (void)addTokenImportance:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchQueryTokenImportanceMetadata;
  v4 = [(GEOPDSearchQueryTokenImportanceMetadata *)&v8 description];
  id v5 = [(GEOPDSearchQueryTokenImportanceMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryTokenImportanceMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 8) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = *(id *)(a1 + 8);
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
        v13 = @"tokenImportance";
      }
      else {
        v13 = @"token_importance";
      }
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v15);
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
  return -[GEOPDSearchQueryTokenImportanceMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      uint64_t v7 = @"tokenImportance";
    }
    else {
      uint64_t v7 = @"token_importance";
    }
    uint64_t v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = v8;
      id v33 = v5;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        p_cache = GEOPDSearchBusinessIntent.cache;
        uint64_t v13 = *(void *)v36;
        uint64_t v34 = v6;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v9);
            }
            long long v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = objc_alloc((Class)(p_cache + 463));
              if (v16)
              {
                long long v17 = v16;
                id v18 = v15;
                uint64_t v19 = [v17 init];
                if (v19)
                {
                  uint64_t v20 = [v18 objectForKeyedSubscript:@"token"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v21 = v13;
                    uint64_t v22 = v11;
                    v23 = p_cache;
                    id v24 = v9;
                    v25 = (void *)[v20 copy];
                    id v26 = v25;
                    v27 = v25;
                    id v9 = v24;
                    p_cache = v23;
                    uint64_t v11 = v22;
                    uint64_t v13 = v21;
                    objc_storeStrong((id *)(v19 + 8), v27);

                    uint64_t v6 = v34;
                  }

                  v28 = [v18 objectForKeyedSubscript:@"score"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v28 floatValue];
                    *(unsigned char *)(v19 + 20) |= 1u;
                    *(_DWORD *)(v19 + 16) = v29;
                  }
                }
              }
              else
              {
                uint64_t v19 = 0;
              }
              -[GEOPDSearchQueryTokenImportanceMetadata addTokenImportance:](v6, (void *)v19);
            }
            ++v14;
          }
          while (v11 != v14);
          uint64_t v30 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
          uint64_t v11 = v30;
        }
        while (v30);
      }

      uint64_t v8 = v32;
      id v5 = v33;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryTokenImportanceMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_tokenImportances;
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
  uint64_t v6 = self->_tokenImportances;
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
        -[GEOPDSearchQueryTokenImportanceMetadata addTokenImportance:]((uint64_t)v5, v11);

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
    tokenImportances = self->_tokenImportances;
    if ((unint64_t)tokenImportances | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](tokenImportances, "isEqual:");
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
  return [(NSMutableArray *)self->_tokenImportances hash];
}

- (void).cxx_destruct
{
}

@end