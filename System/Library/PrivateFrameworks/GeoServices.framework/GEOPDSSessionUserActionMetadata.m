@interface GEOPDSSessionUserActionMetadata
+ (BOOL)isValid:(id)a3;
+ (Class)userActionMetadataElementType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSSessionUserActionMetadata)initWithDictionary:(id)a3;
- (GEOPDSSessionUserActionMetadata)initWithJSON:(id)a3;
- (NSMutableArray)userActionMetadataElements;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)userActionMetadataElementAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)userActionMetadataElementsCount;
- (void)_initWithDictionary:(uint64_t)a3 isJSON:;
- (void)addUserActionMetadataElement:(id)a3;
- (void)clearUnknownFields:(BOOL)a3;
- (void)clearUserActionMetadataElements;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setUserActionMetadataElements:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSSessionUserActionMetadata

- (NSMutableArray)userActionMetadataElements
{
  return self->_userActionMetadataElements;
}

- (void)setUserActionMetadataElements:(id)a3
{
}

- (void)clearUserActionMetadataElements
{
}

- (void)addUserActionMetadataElement:(id)a3
{
  id v4 = a3;
  userActionMetadataElements = self->_userActionMetadataElements;
  id v8 = v4;
  if (!userActionMetadataElements)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_userActionMetadataElements;
    self->_userActionMetadataElements = v6;

    id v4 = v8;
    userActionMetadataElements = self->_userActionMetadataElements;
  }
  [(NSMutableArray *)userActionMetadataElements addObject:v4];
}

- (unint64_t)userActionMetadataElementsCount
{
  return [(NSMutableArray *)self->_userActionMetadataElements count];
}

- (id)userActionMetadataElementAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userActionMetadataElements objectAtIndex:a3];
}

+ (Class)userActionMetadataElementType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSessionUserActionMetadata;
  id v4 = [(GEOPDSSessionUserActionMetadata *)&v8 description];
  v5 = [(GEOPDSSessionUserActionMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSessionUserActionMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"userActionMetadataElement";
      }
      else {
        v13 = @"user_action_metadata_element";
      }
      [v4 setObject:v5 forKey:v13];
    }
    v14 = *(void **)(a1 + 8);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __61__GEOPDSSessionUserActionMetadata__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOPDSSessionUserActionMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __61__GEOPDSSessionUserActionMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDSSessionUserActionMetadata)initWithDictionary:(id)a3
{
  return (GEOPDSSessionUserActionMetadata *)-[GEOPDSSessionUserActionMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"userActionMetadataElement";
      }
      else {
        id v6 = @"user_action_metadata_element";
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
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v20 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEOPDSUserActionMetadataElement alloc];
                if (v14) {
                  v15 = (void *)-[GEOPDSUserActionMetadataElement _initWithDictionary:isJSON:](v14, v13, a3);
                }
                else {
                  v15 = 0;
                }
                [a1 addUserActionMetadataElement:v15];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v16 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
            uint64_t v10 = v16;
          }
          while (v16);
        }

        id v5 = v18;
      }
    }
  }

  return a1;
}

- (GEOPDSSessionUserActionMetadata)initWithJSON:(id)a3
{
  return (GEOPDSSessionUserActionMetadata *)-[GEOPDSSessionUserActionMetadata _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDSSessionUserActionMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSessionUserActionMetadataReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_userActionMetadataElements;
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
  [(GEOPDSSessionUserActionMetadata *)self readAll:0];
  if ([(GEOPDSSessionUserActionMetadata *)self userActionMetadataElementsCount])
  {
    [v8 clearUserActionMetadataElements];
    unint64_t v4 = [(GEOPDSSessionUserActionMetadata *)self userActionMetadataElementsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPDSSessionUserActionMetadata *)self userActionMetadataElementAtIndex:i];
        [v8 addUserActionMetadataElement:v7];
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
  uint64_t v6 = self->_userActionMetadataElements;
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
        [v5 addUserActionMetadataElement:v11];

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
    [(GEOPDSSessionUserActionMetadata *)self readAll:1];
    [v4 readAll:1];
    userActionMetadataElements = self->_userActionMetadataElements;
    if ((unint64_t)userActionMetadataElements | v4[2]) {
      char v5 = -[NSMutableArray isEqual:](userActionMetadataElements, "isEqual:");
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
  [(GEOPDSSessionUserActionMetadata *)self readAll:1];
  userActionMetadataElements = self->_userActionMetadataElements;

  return [(NSMutableArray *)userActionMetadataElements hash];
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
        -[GEOPDSSessionUserActionMetadata addUserActionMetadataElement:](self, "addUserActionMetadataElement:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDSSessionUserActionMetadata *)self readAll:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_userActionMetadataElements;
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
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          if (v11)
          {
            long long v12 = *(void **)(v11 + 8);
            *(void *)(v11 + 8) = 0;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActionMetadataElements, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end