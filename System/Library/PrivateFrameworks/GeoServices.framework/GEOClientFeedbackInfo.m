@interface GEOClientFeedbackInfo
+ (BOOL)isValid:(id)a3;
+ (Class)displayedBannerEventInfoType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOClientFeedbackInfo)initWithDictionary:(id)a3;
- (GEOClientFeedbackInfo)initWithJSON:(id)a3;
- (NSMutableArray)displayedBannerEventInfos;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)displayedBannerEventInfoAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)displayedBannerEventInfosCount;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addDisplayedBannerEventInfo:(id)a3;
- (void)clearDisplayedBannerEventInfos;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayedBannerEventInfos:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOClientFeedbackInfo

- (NSMutableArray)displayedBannerEventInfos
{
  return self->_displayedBannerEventInfos;
}

- (void)setDisplayedBannerEventInfos:(id)a3
{
}

- (void)clearDisplayedBannerEventInfos
{
}

- (void)addDisplayedBannerEventInfo:(id)a3
{
  id v4 = a3;
  displayedBannerEventInfos = self->_displayedBannerEventInfos;
  id v8 = v4;
  if (!displayedBannerEventInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_displayedBannerEventInfos;
    self->_displayedBannerEventInfos = v6;

    id v4 = v8;
    displayedBannerEventInfos = self->_displayedBannerEventInfos;
  }
  [(NSMutableArray *)displayedBannerEventInfos addObject:v4];
}

- (unint64_t)displayedBannerEventInfosCount
{
  return [(NSMutableArray *)self->_displayedBannerEventInfos count];
}

- (id)displayedBannerEventInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_displayedBannerEventInfos objectAtIndex:a3];
}

+ (Class)displayedBannerEventInfoType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOClientFeedbackInfo;
  id v4 = [(GEOClientFeedbackInfo *)&v8 description];
  v5 = [(GEOClientFeedbackInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientFeedbackInfo _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[2])
    {
      if (a2)
      {
        v5 = (void *)MEMORY[0x1E4F1CA48];
        v6 = [a1 displayedBannerEventInfos];
        v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        objc_super v8 = [a1 displayedBannerEventInfos];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) base64EncodedStringWithOptions:0];
              [v7 addObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v10);
        }

        v14 = @"displayedBannerEventInfo";
      }
      else
      {
        v7 = [a1 displayedBannerEventInfos];
        v14 = @"displayed_banner_event_info";
      }
      [v4 setObject:v7 forKey:v14];
    }
    v15 = (void *)a1[1];
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __51__GEOClientFeedbackInfo__dictionaryRepresentation___block_invoke;
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
  return -[GEOClientFeedbackInfo _dictionaryRepresentation:](self, 1);
}

void __51__GEOClientFeedbackInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOClientFeedbackInfo)initWithDictionary:(id)a3
{
  return (GEOClientFeedbackInfo *)-[GEOClientFeedbackInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"displayedBannerEventInfo";
      }
      else {
        v6 = @"displayed_banner_event_info";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v14 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                v15 = objc_msgSend(v14, "initWithBase64EncodedString:options:", v13, 0, (void)v17);
                [a1 addDisplayedBannerEventInfo:v15];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v10);
        }
      }
    }
  }

  return a1;
}

- (GEOClientFeedbackInfo)initWithJSON:(id)a3
{
  return (GEOClientFeedbackInfo *)-[GEOClientFeedbackInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientFeedbackInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientFeedbackInfoReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_displayedBannerEventInfos;
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
        PBDataWriterWriteDataField();
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
  [(GEOClientFeedbackInfo *)self readAll:0];
  if ([(GEOClientFeedbackInfo *)self displayedBannerEventInfosCount])
  {
    [v8 clearDisplayedBannerEventInfos];
    unint64_t v4 = [(GEOClientFeedbackInfo *)self displayedBannerEventInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOClientFeedbackInfo *)self displayedBannerEventInfoAtIndex:i];
        [v8 addDisplayedBannerEventInfo:v7];
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
  uint64_t v6 = self->_displayedBannerEventInfos;
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
        [v5 addDisplayedBannerEventInfo:v11];

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
    [(GEOClientFeedbackInfo *)self readAll:1];
    [v4 readAll:1];
    displayedBannerEventInfos = self->_displayedBannerEventInfos;
    if ((unint64_t)displayedBannerEventInfos | v4[2]) {
      char v5 = -[NSMutableArray isEqual:](displayedBannerEventInfos, "isEqual:");
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
  [(GEOClientFeedbackInfo *)self readAll:1];
  displayedBannerEventInfos = self->_displayedBannerEventInfos;

  return [(NSMutableArray *)displayedBannerEventInfos hash];
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
        -[GEOClientFeedbackInfo addDisplayedBannerEventInfo:](self, "addDisplayedBannerEventInfo:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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
    [(GEOClientFeedbackInfo *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedBannerEventInfos, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end