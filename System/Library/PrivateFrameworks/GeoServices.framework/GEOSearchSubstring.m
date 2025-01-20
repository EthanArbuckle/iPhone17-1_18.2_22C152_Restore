@interface GEOSearchSubstring
+ (BOOL)isValid:(id)a3;
+ (Class)spanDataType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSearchSubstring)initWithDictionary:(id)a3;
- (GEOSearchSubstring)initWithJSON:(id)a3;
- (NSMutableArray)spanDatas;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)spanDataAtIndex:(unint64_t)a3;
- (id)stringTypeAsString:(int)a3;
- (int)StringAsStringType:(id)a3;
- (int)beginIndex;
- (int)endIndex;
- (int)stringType;
- (unint64_t)hash;
- (unint64_t)spanDatasCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addSpanData:(id)a3;
- (void)clearSpanDatas;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBeginIndex:(int)a3;
- (void)setEndIndex:(int)a3;
- (void)setSpanDatas:(id)a3;
- (void)setStringType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSearchSubstring

- (int)stringType
{
  return self->_stringType;
}

- (void)setStringType:(int)a3
{
  self->_stringType = a3;
}

- (id)stringTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E7208[a3];
  }

  return v3;
}

- (int)StringAsStringType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PLACE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CATEGORY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"IGNORE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ATTRIBUTE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)beginIndex
{
  return self->_beginIndex;
}

- (void)setBeginIndex:(int)a3
{
  self->_beginIndex = a3;
}

- (int)endIndex
{
  return self->_endIndex;
}

- (void)setEndIndex:(int)a3
{
  self->_endIndex = a3;
}

- (NSMutableArray)spanDatas
{
  return self->_spanDatas;
}

- (void)setSpanDatas:(id)a3
{
}

- (void)clearSpanDatas
{
}

- (void)addSpanData:(id)a3
{
  id v4 = a3;
  spanDatas = self->_spanDatas;
  id v8 = v4;
  if (!spanDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_spanDatas;
    self->_spanDatas = v6;

    id v4 = v8;
    spanDatas = self->_spanDatas;
  }
  [(NSMutableArray *)spanDatas addObject:v4];
}

- (unint64_t)spanDatasCount
{
  return [(NSMutableArray *)self->_spanDatas count];
}

- (id)spanDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_spanDatas objectAtIndex:a3];
}

+ (Class)spanDataType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchSubstring;
  id v4 = [(GEOSearchSubstring *)&v8 description];
  v5 = [(GEOSearchSubstring *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchSubstring _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = *(int *)(a1 + 32);
    if (v5 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E53E7208[v5];
    }
    [v4 setObject:v6 forKey:@"stringType"];

    v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 24)];
    [v4 setObject:v7 forKey:@"beginIndex"];

    objc_super v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 28)];
    [v4 setObject:v8 forKey:@"endIndex"];

    if (*(void *)(a1 + 16))
    {
      v9 = [(id)a1 spanDatas];
      if (a2) {
        v10 = @"spanData";
      }
      else {
        v10 = @"span_data";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __48__GEOSearchSubstring__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOSearchSubstring _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOSearchSubstring__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSearchSubstring)initWithDictionary:(id)a3
{
  return (GEOSearchSubstring *)-[GEOSearchSubstring _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_38;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_38;
  }
  v6 = [v5 objectForKeyedSubscript:@"stringType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"PLACE"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"BUSINESS"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"CATEGORY"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"IGNORE"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"ATTRIBUTE"])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_18:
    [a1 setStringType:v8];
  }

  v9 = [v5 objectForKeyedSubscript:@"beginIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBeginIndex:", objc_msgSend(v9, "intValue"));
  }

  id v10 = [v5 objectForKeyedSubscript:@"endIndex"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEndIndex:", objc_msgSend(v10, "intValue"));
  }

  if (a3) {
    v11 = @"spanData";
  }
  else {
    v11 = @"span_data";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = objc_msgSend(v18, "copy", (void)v21);
            [a1 addSpanData:v19];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
  }
LABEL_38:

  return a1;
}

- (GEOSearchSubstring)initWithJSON:(id)a3
{
  return (GEOSearchSubstring *)-[GEOSearchSubstring _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSearchSubstringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSearchSubstringReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_spanDatas;
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
  [(GEOSearchSubstring *)self readAll:0];
  v8[8] = self->_stringType;
  v8[6] = self->_beginIndex;
  v8[7] = self->_endIndex;
  if ([(GEOSearchSubstring *)self spanDatasCount])
  {
    [v8 clearSpanDatas];
    unint64_t v4 = [(GEOSearchSubstring *)self spanDatasCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOSearchSubstring *)self spanDataAtIndex:i];
        [v8 addSpanData:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 32) = self->_stringType;
  *(_DWORD *)(v5 + 24) = self->_beginIndex;
  *(_DWORD *)(v5 + 28) = self->_endIndex;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_spanDatas;
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
        [(id)v5 addSpanData:v11];

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
    && ([(GEOSearchSubstring *)self readAll:1],
        [v4 readAll:1],
        self->_stringType == *((_DWORD *)v4 + 8))
    && self->_beginIndex == *((_DWORD *)v4 + 6)
    && self->_endIndex == *((_DWORD *)v4 + 7))
  {
    spanDatas = self->_spanDatas;
    if ((unint64_t)spanDatas | v4[2]) {
      char v6 = -[NSMutableArray isEqual:](spanDatas, "isEqual:");
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
  [(GEOSearchSubstring *)self readAll:1];
  uint64_t v3 = (2654435761 * self->_beginIndex) ^ (2654435761 * self->_stringType);
  uint64_t v4 = 2654435761 * self->_endIndex;
  return v3 ^ v4 ^ [(NSMutableArray *)self->_spanDatas hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  self->_stringType = *((_DWORD *)v4 + 8);
  self->_beginIndex = *((_DWORD *)v4 + 6);
  self->_endIndex = *((_DWORD *)v4 + 7);
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
        -[GEOSearchSubstring addSpanData:](self, "addSpanData:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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
    [(GEOSearchSubstring *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanDatas, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end