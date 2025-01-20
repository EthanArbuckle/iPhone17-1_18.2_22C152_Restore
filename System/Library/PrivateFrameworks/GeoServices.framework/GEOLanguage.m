@interface GEOLanguage
+ (BOOL)isValid:(id)a3;
+ (Class)languageType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLanguage)initWithDictionary:(id)a3;
- (GEOLanguage)initWithJSON:(id)a3;
- (NSMutableArray)languages;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)languageAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)languagesCount;
- (unsigned)identifier;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)addLanguage:(id)a3;
- (void)clearLanguages;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(unsigned int)a3;
- (void)setLanguages:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLanguage

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (NSMutableArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
}

- (void)clearLanguages
{
}

- (void)addLanguage:(id)a3
{
  id v4 = a3;
  languages = self->_languages;
  id v8 = v4;
  if (!languages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_languages;
    self->_languages = v6;

    id v4 = v8;
    languages = self->_languages;
  }
  [(NSMutableArray *)languages addObject:v4];
}

- (unint64_t)languagesCount
{
  return [(NSMutableArray *)self->_languages count];
}

- (id)languageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_languages objectAtIndex:a3];
}

+ (Class)languageType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLanguage;
  id v4 = [(GEOLanguage *)&v8 description];
  v5 = [(GEOLanguage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLanguage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    [v4 setObject:v5 forKey:@"identifier"];

    if (*(void *)(a1 + 16))
    {
      v6 = [(id)a1 languages];
      [v4 setObject:v6 forKey:@"language"];
    }
    v7 = *(void **)(a1 + 8);
    if (v7)
    {
      objc_super v8 = [v7 dictionaryRepresentation];
      v9 = v8;
      if (a2)
      {
        v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __41__GEOLanguage__dictionaryRepresentation___block_invoke;
        v14[3] = &unk_1E53D8860;
        id v11 = v10;
        id v15 = v11;
        [v9 enumerateKeysAndObjectsUsingBlock:v14];
        id v12 = v11;

        v9 = v12;
      }
      [v4 setObject:v9 forKey:@"Unknown Fields"];
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
  return -[GEOLanguage _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOLanguage__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOLanguage)initWithDictionary:(id)a3
{
  return (GEOLanguage *)-[GEOLanguage _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v4 = [v3 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIdentifier:", objc_msgSend(v4, "unsignedIntValue"));
      }

      id v5 = [v3 objectForKeyedSubscript:@"language"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v15;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v15 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v12 = objc_msgSend(v11, "copy", (void)v14);
                [a1 addLanguage:v12];
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v8);
        }
      }
    }
  }

  return a1;
}

- (GEOLanguage)initWithJSON:(id)a3
{
  return (GEOLanguage *)-[GEOLanguage _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLanguageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLanguageReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_languages;
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
        PBDataWriterWriteStringField();
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
  uint64_t v8 = a3;
  [(GEOLanguage *)self readAll:0];
  v8[6] = self->_identifier;
  if ([(GEOLanguage *)self languagesCount])
  {
    [v8 clearLanguages];
    unint64_t v4 = [(GEOLanguage *)self languagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOLanguage *)self languageAtIndex:i];
        [v8 addLanguage:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_identifier;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_languages;
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
        [(id)v5 addLanguage:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEOLanguage *)self readAll:1],
        [v4 readAll:1],
        self->_identifier == *((_DWORD *)v4 + 6)))
  {
    languages = self->_languages;
    if ((unint64_t)languages | v4[2]) {
      char v6 = -[NSMutableArray isEqual:](languages, "isEqual:");
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
  [(GEOLanguage *)self readAll:1];
  uint64_t v3 = 2654435761 * self->_identifier;
  return [(NSMutableArray *)self->_languages hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  self->_identifier = *((_DWORD *)v4 + 6);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[GEOLanguage addLanguage:](self, "addLanguage:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOLanguage *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languages, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end