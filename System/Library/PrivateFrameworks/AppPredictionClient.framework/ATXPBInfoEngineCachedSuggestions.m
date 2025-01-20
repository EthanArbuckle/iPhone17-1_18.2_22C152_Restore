@interface ATXPBInfoEngineCachedSuggestions
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)cachedSuggestionIdsAtIndex:(id *)a1;
- (id)cachedSuggestionSourceIdsAtIndex:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addCachedSuggestionIds:(uint64_t)a1;
- (uint64_t)addCachedSuggestionSourceIds:(uint64_t)a1;
- (uint64_t)cachedSuggestionIds;
- (uint64_t)cachedSuggestionIdsCount;
- (uint64_t)cachedSuggestionSourceIds;
- (uint64_t)cachedSuggestionSourceIdsCount;
- (uint64_t)clearCachedSuggestionIds;
- (uint64_t)clearCachedSuggestionSourceIds;
- (uint64_t)hasLength;
- (uint64_t)length;
- (uint64_t)setHasLength:(uint64_t)result;
- (uint64_t)setLength:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setCachedSuggestionIds:(uint64_t)a1;
- (void)setCachedSuggestionSourceIds:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBInfoEngineCachedSuggestions

- (uint64_t)setLength:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 32) |= 1u;
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasLength:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasLength
{
  if (result) {
    return *(unsigned char *)(result + 32) & 1;
  }
  return result;
}

- (uint64_t)clearCachedSuggestionIds
{
  if (result) {
    return [*(id *)(result + 16) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedSuggestionIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 16);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;

      v5 = *(void **)(a1 + 16);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedSuggestionIdsCount
{
  if (result) {
    return [*(id *)(result + 16) count];
  }
  return result;
}

- (id)cachedSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[2] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearCachedSuggestionSourceIds
{
  if (result) {
    return [*(id *)(result + 24) removeAllObjects];
  }
  return result;
}

- (uint64_t)addCachedSuggestionSourceIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 24);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      v5 = *(void **)(a1 + 24);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)cachedSuggestionSourceIdsCount
{
  if (result) {
    return [*(id *)(result + 24) count];
  }
  return result;
}

- (id)cachedSuggestionSourceIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[3] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBInfoEngineCachedSuggestions;
  id v4 = [(ATXPBInfoEngineCachedSuggestions *)&v8 description];
  v5 = [(ATXPBInfoEngineCachedSuggestions *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_length];
    [v3 setObject:v4 forKey:@"length"];
  }
  cachedSuggestionIds = self->_cachedSuggestionIds;
  if (cachedSuggestionIds) {
    [v3 setObject:cachedSuggestionIds forKey:@"cachedSuggestionIds"];
  }
  cachedSuggestionSourceIds = self->_cachedSuggestionSourceIds;
  if (cachedSuggestionSourceIds) {
    [v3 setObject:cachedSuggestionSourceIds forKey:@"cachedSuggestionSourceIds"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBInfoEngineCachedSuggestionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_cachedSuggestionIds;
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
        PBDataWriterWriteStringField();
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
  v10 = self->_cachedSuggestionSourceIds;
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
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v11 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 32))
    {
      *((void *)v11 + 1) = *(void *)(a1 + 8);
      *((unsigned char *)v11 + 32) |= 1u;
    }
    if ([*(id *)(a1 + 16) count])
    {
      if (v11) {
        [*((id *)v11 + 2) removeAllObjects];
      }
      uint64_t v3 = [*(id *)(a1 + 16) count];
      if (v3)
      {
        uint64_t v4 = v3;
        for (uint64_t i = 0; i != v4; ++i)
        {
          uint64_t v6 = [*(id *)(a1 + 16) objectAtIndex:i];
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionIds:]((uint64_t)v11, v6);
        }
      }
    }
    if ([*(id *)(a1 + 24) count])
    {
      if (v11) {
        [*((id *)v11 + 3) removeAllObjects];
      }
      uint64_t v7 = [*(id *)(a1 + 24) count];
      if (v7)
      {
        uint64_t v8 = v7;
        for (uint64_t j = 0; j != v8; ++j)
        {
          v10 = [*(id *)(a1 + 24) objectAtIndex:j];
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionSourceIds:]((uint64_t)v11, v10);
        }
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_length;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_cachedSuggestionIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * v11) copyWithZone:a3];
        -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionIds:]((uint64_t)v6, v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v13 = self->_cachedSuggestionSourceIds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionSourceIds:]((uint64_t)v6, v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_length != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  cachedSuggestionIds = self->_cachedSuggestionIds;
  if ((unint64_t)cachedSuggestionIds | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](cachedSuggestionIds, "isEqual:"))
  {
    goto LABEL_11;
  }
  cachedSuggestionSourceIds = self->_cachedSuggestionSourceIds;
  if ((unint64_t)cachedSuggestionSourceIds | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](cachedSuggestionSourceIds, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_length;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_cachedSuggestionIds hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_cachedSuggestionSourceIds hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if ((_BYTE)v3[4])
    {
      *(void *)(a1 + 8) = v3[1];
      *(unsigned char *)(a1 + 32) |= 1u;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v3[2];
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
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionIds:](a1, *(void **)(*((void *)&v19 + 1) + 8 * v9++));
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
    id v10 = v4[3];
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
          -[ATXPBInfoEngineCachedSuggestions addCachedSuggestionSourceIds:](a1, *(void **)(*((void *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (uint64_t)length
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)cachedSuggestionIds
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setCachedSuggestionIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (uint64_t)cachedSuggestionSourceIds
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setCachedSuggestionSourceIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSuggestionSourceIds, 0);

  objc_storeStrong((id *)&self->_cachedSuggestionIds, 0);
}

@end