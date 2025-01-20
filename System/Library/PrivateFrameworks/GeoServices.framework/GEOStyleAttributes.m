@interface GEOStyleAttributes
+ (BOOL)isValid:(id)a3;
+ (Class)attributeType;
+ (id)attributesForTransitLine:(id)a3;
+ (id)attributesForTransitSystem:(id)a3;
- (BOOL)hasCustomIconId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOStyleAttributes)initWithDictionary:(id)a3;
- (GEOStyleAttributes)initWithGEOFeatureStyleAttributes:(id)a3;
- (GEOStyleAttributes)initWithJSON:(id)a3;
- (NSMutableArray)attributes;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributeAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)attributesCount;
- (unint64_t)customIconId;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addAttribute:(id)a3;
- (void)clearAttributes;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setCustomIconId:(unint64_t)a3;
- (void)setHasCustomIconId:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStyleAttributes

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (unint64_t)customIconId
{
  return self->_customIconId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_attributes;
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
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [(id)v5 addAttribute:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 24) = self->_customIconId;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (void)addAttribute:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  id v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_attributes;
    self->_attributes = v6;

    id v4 = v8;
    attributes = self->_attributes;
  }
  [(NSMutableArray *)attributes addObject:v4];
}

- (BOOL)readFrom:(id)a3
{
  return GEOStyleAttributesReadAllFrom((uint64_t)self, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_attributes;
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

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint64Field();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (GEOStyleAttributes)initWithGEOFeatureStyleAttributes:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOStyleAttributes;
  uint64_t v5 = [(GEOStyleAttributes *)&v11 init];
  if (v5)
  {
    [v4 sort];
    uint64_t v6 = (unsigned int *)[v4 v];
    unsigned __int8 v7 = 0;
    while (1)
    {
      unsigned __int8 v8 = v7;
      if (v7 >= [v4 countAttrs]) {
        break;
      }
      uint64_t v9 = objc_opt_new();
      [v9 setKey:*v6];
      [v9 setValue:v6[1]];
      [(GEOStyleAttributes *)v5 addAttribute:v9];

      unsigned __int8 v7 = v8 + 1;
      v6 += 2;
    }
  }

  return v5;
}

- (void)setAttributes:(id)a3
{
}

- (void)clearAttributes
{
}

- (unint64_t)attributesCount
{
  return [(NSMutableArray *)self->_attributes count];
}

- (id)attributeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attributes objectAtIndex:a3];
}

+ (Class)attributeType
{
  return (Class)objc_opt_class();
}

- (void)setCustomIconId:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_customIconId = a3;
}

- (void)setHasCustomIconId:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCustomIconId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStyleAttributes;
  id v4 = [(GEOStyleAttributes *)&v8 description];
  uint64_t v5 = [(GEOStyleAttributes *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStyleAttributes _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_super v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            long long v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"attribute"];
    }
    if (*(unsigned char *)(a1 + 32))
    {
      long long v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      if (a2) {
        long long v14 = @"customIconId";
      }
      else {
        long long v14 = @"custom_icon_id";
      }
      [v4 setObject:v13 forKey:v14];
    }
    uint64_t v15 = *(void **)(a1 + 8);
    if (v15)
    {
      long long v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __48__GEOStyleAttributes__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOStyleAttributes _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOStyleAttributes__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOStyleAttributes)initWithDictionary:(id)a3
{
  return (GEOStyleAttributes *)-[GEOStyleAttributes _initWithDictionary:isJSON:](self, a3, 0);
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
      id v6 = [v5 objectForKeyedSubscript:@"attribute"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v19 = v6;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v13 = [GEOStyleAttribute alloc];
                if (a3) {
                  uint64_t v14 = [(GEOStyleAttribute *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOStyleAttribute *)v13 initWithDictionary:v12];
                }
                uint64_t v15 = (void *)v14;
                [a1 addAttribute:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v9);
        }

        id v6 = v19;
      }

      if (a3) {
        long long v16 = @"customIconId";
      }
      else {
        long long v16 = @"custom_icon_id";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setCustomIconId:", objc_msgSend(v17, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOStyleAttributes)initWithJSON:(id)a3
{
  return (GEOStyleAttributes *)-[GEOStyleAttributes _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStyleAttributesIsValid((char *)a3);
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [(GEOStyleAttributes *)self readAll:0];
  if ([(GEOStyleAttributes *)self attributesCount])
  {
    [v8 clearAttributes];
    unint64_t v4 = [(GEOStyleAttributes *)self attributesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(GEOStyleAttributes *)self attributeAtIndex:i];
        [v8 addAttribute:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((void *)v8 + 3) = self->_customIconId;
    *((unsigned char *)v8 + 32) |= 1u;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOStyleAttributes *)self readAll:1];
  [v4 readAll:1];
  attributes = self->_attributes;
  if ((unint64_t)attributes | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](attributes, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_customIconId == *((void *)v4 + 3))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  [(GEOStyleAttributes *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_attributes hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v4 = 2654435761u * self->_customIconId;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        -[GEOStyleAttributes addAttribute:](self, "addAttribute:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 32))
  {
    self->_customIconId = *((void *)v4 + 3);
    *(unsigned char *)&self->_flags |= 1u;
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
    [(GEOStyleAttributes *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_attributes;
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

+ (id)attributesForTransitLine:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 styleAttributes];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)attributesForTransitSystem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 styleAttributes];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end