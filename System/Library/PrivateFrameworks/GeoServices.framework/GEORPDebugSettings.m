@interface GEORPDebugSettings
+ (BOOL)isValid:(id)a3;
+ (Class)keywordsType;
- (BOOL)hasMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPDebugSettings)initWithDictionary:(id)a3;
- (GEORPDebugSettings)initWithJSON:(id)a3;
- (NSMutableArray)keywords;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keywordsAtIndex:(unint64_t)a3;
- (id)modeAsString:(int)a3;
- (int)StringAsMode:(id)a3;
- (int)mode;
- (unint64_t)hash;
- (unint64_t)keywordsCount;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)addKeywords:(id)a3;
- (void)clearKeywords;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setKeywords:(id)a3;
- (void)setMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPDebugSettings

- (int)mode
{
  if (*(unsigned char *)&self->_flags) {
    return self->_mode;
  }
  else {
    return 0;
  }
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMode
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    v3 = (void *)*((void *)&off_1E53EC6A8 + a3);
  }

  return v3;
}

- (int)StringAsMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEBUG_MODE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MONITORING_SERVICE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"E2E_TESTING"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
}

- (void)clearKeywords
{
}

- (void)addKeywords:(id)a3
{
  id v4 = a3;
  keywords = self->_keywords;
  id v8 = v4;
  if (!keywords)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_keywords;
    self->_keywords = v6;

    id v4 = v8;
    keywords = self->_keywords;
  }
  [(NSMutableArray *)keywords addObject:v4];
}

- (unint64_t)keywordsCount
{
  return [(NSMutableArray *)self->_keywords count];
}

- (id)keywordsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_keywords objectAtIndex:a3];
}

+ (Class)keywordsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPDebugSettings;
  id v4 = [(GEORPDebugSettings *)&v8 description];
  v5 = [(GEORPDebugSettings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v3 = *(int *)(a1 + 16);
      if (v3 >= 3)
      {
        id v4 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
      }
      else
      {
        id v4 = (void *)*((void *)&off_1E53EC6A8 + v3);
      }
      [v2 setObject:v4 forKey:@"mode"];
    }
    if (*(void *)(a1 + 8))
    {
      v5 = [(id)a1 keywords];
      [v2 setObject:v5 forKey:@"keywords"];
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (GEORPDebugSettings)initWithDictionary:(id)a3
{
  return (GEORPDebugSettings *)-[GEORPDebugSettings _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1) {
    goto LABEL_27;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_27;
  }
  id v4 = [v3 objectForKeyedSubscript:@"mode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 isEqualToString:@"DEBUG_MODE_UNKNOWN"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"MONITORING_SERVICE"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"E2E_TESTING"])
    {
      uint64_t v6 = 2;
    }
    else
    {
      uint64_t v6 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 intValue];
LABEL_14:
    [a1 setMode:v6];
  }

  v7 = [v3 objectForKeyedSubscript:@"keywords"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = objc_msgSend(v13, "copy", (void)v16);
            [a1 addKeywords:v14];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
LABEL_27:

  return a1;
}

- (GEORPDebugSettings)initWithJSON:(id)a3
{
  return (GEORPDebugSettings *)-[GEORPDebugSettings _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPDebugSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPDebugSettingsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_keywords;
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
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  [(GEORPDebugSettings *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v8[4] = self->_mode;
    *((unsigned char *)v8 + 20) |= 1u;
  }
  if ([(GEORPDebugSettings *)self keywordsCount])
  {
    [v8 clearKeywords];
    unint64_t v4 = [(GEORPDebugSettings *)self keywordsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPDebugSettings *)self keywordsAtIndex:i];
        [v8 addKeywords:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_mode;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_keywords;
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
        [v6 addKeywords:v12];

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
  [(GEORPDebugSettings *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_mode != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  keywords = self->_keywords;
  if ((unint64_t)keywords | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](keywords, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPDebugSettings *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_mode;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSMutableArray *)self->_keywords hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 20))
  {
    self->_mode = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[GEORPDebugSettings addKeywords:](self, "addKeywords:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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