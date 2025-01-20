@interface GEOPDSearchKeywordMapping
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)addLocalizedName:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchKeywordMapping

- (void)addLocalizedName:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchKeywordMapping;
  v4 = [(GEOPDSearchKeywordMapping *)&v8 description];
  id v5 = [(GEOPDSearchKeywordMapping *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchKeywordMapping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 24))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      [v4 setObject:v5 forKey:@"muid"];
    }
    if ([*(id *)(a1 + 8) count])
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = *(id *)(a1 + 8);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (a2) {
              [v12 jsonRepresentation];
            }
            else {
            v13 = objc_msgSend(v12, "dictionaryRepresentation", (void)v16);
            }
            objc_msgSend(v6, "addObject:", v13, (void)v16);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }

      if (a2) {
        v14 = @"localizedName";
      }
      else {
        v14 = @"localized_name";
      }
      objc_msgSend(v4, "setObject:forKey:", v6, v14, (void)v16);
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
  return -[GEOPDSearchKeywordMapping _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"muid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 unsignedLongLongValue];
      *(unsigned char *)(v6 + 24) |= 1u;
      *(void *)(v6 + 16) = v8;
    }

    if (a3) {
      uint64_t v9 = @"localizedName";
    }
    else {
      uint64_t v9 = @"localized_name";
    }
    uint64_t v10 = [v5 objectForKeyedSubscript:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v21 = v10;
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
              long long v17 = [GEOLocalizedString alloc];
              if (a3) {
                long long v18 = [(GEOLocalizedString *)v17 initWithJSON:v16];
              }
              else {
                long long v18 = [(GEOLocalizedString *)v17 initWithDictionary:v16];
              }
              long long v19 = v18;
              -[GEOPDSearchKeywordMapping addLocalizedName:](v6, v18);
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v13);
      }

      uint64_t v10 = v21;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchKeywordMappingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_localizedNames;
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 16) = self->_muid;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_localizedNames;
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
        -[GEOPDSearchKeywordMapping addLocalizedName:]((uint64_t)v6, v12);

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
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_muid != *((void *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  localizedNames = self->_localizedNames;
  if ((unint64_t)localizedNames | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](localizedNames, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    unint64_t v2 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_localizedNames hash] ^ v2;
}

- (void).cxx_destruct
{
}

@end