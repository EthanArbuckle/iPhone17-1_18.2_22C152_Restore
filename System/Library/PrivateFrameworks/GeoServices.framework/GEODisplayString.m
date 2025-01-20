@interface GEODisplayString
+ (BOOL)isValid:(id)a3;
+ (Class)localizedStringsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODisplayString)initWithDictionary:(id)a3;
- (GEODisplayString)initWithJSON:(id)a3;
- (NSMutableArray)localizedStrings;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizedStringsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)localizedStringsCount;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addLocalizedStrings:(id)a3;
- (void)clearLocalizedStrings;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocalizedStrings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODisplayString

- (void)addLocalizedStrings:(id)a3
{
  id v4 = a3;
  localizedStrings = self->_localizedStrings;
  id v8 = v4;
  if (!localizedStrings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_localizedStrings;
    self->_localizedStrings = v6;

    id v4 = v8;
    localizedStrings = self->_localizedStrings;
  }
  [(NSMutableArray *)localizedStrings addObject:v4];
}

- (NSMutableArray)localizedStrings
{
  return self->_localizedStrings;
}

- (void)setLocalizedStrings:(id)a3
{
}

- (void)clearLocalizedStrings
{
}

- (unint64_t)localizedStringsCount
{
  return [(NSMutableArray *)self->_localizedStrings count];
}

- (id)localizedStringsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_localizedStrings objectAtIndex:a3];
}

+ (Class)localizedStringsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODisplayString;
  id v4 = [(GEODisplayString *)&v8 description];
  v5 = [(GEODisplayString *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODisplayString _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v23 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"localizedStrings"];
    }
    v13 = *(void **)(a1 + 8);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __46__GEODisplayString__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEODisplayString _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEODisplayString__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEODisplayString)initWithDictionary:(id)a3
{
  return (GEODisplayString *)-[GEODisplayString _initWithDictionary:isJSON:](self, a3, 0);
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
      id v6 = [v5 objectForKeyedSubscript:@"localizedStrings"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v17 = v6;
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
                v13 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v14 = [(GEOLocalizedString *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOLocalizedString *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addLocalizedStrings:v14];
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

- (GEODisplayString)initWithJSON:(id)a3
{
  return (GEODisplayString *)-[GEODisplayString _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEODisplayStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODisplayStringReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_localizedStrings;
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

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEODisplayString *)self readAll:0];
  if ([(GEODisplayString *)self localizedStringsCount])
  {
    [v8 clearLocalizedStrings];
    unint64_t v4 = [(GEODisplayString *)self localizedStringsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEODisplayString *)self localizedStringsAtIndex:i];
        [v8 addLocalizedStrings:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_localizedStrings;
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
        [v5 addLocalizedStrings:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEODisplayString *)self readAll:1];
    [v4 readAll:1];
    localizedStrings = self->_localizedStrings;
    if ((unint64_t)localizedStrings | v4[2]) {
      char v5 = -[NSMutableArray isEqual:](localizedStrings, "isEqual:");
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
  [(GEODisplayString *)self readAll:1];
  localizedStrings = self->_localizedStrings;

  return [(NSMutableArray *)localizedStrings hash];
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
  id v5 = v4[2];
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
        -[GEODisplayString addLocalizedStrings:](self, "addLocalizedStrings:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEODisplayString *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_localizedStrings;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStrings, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end