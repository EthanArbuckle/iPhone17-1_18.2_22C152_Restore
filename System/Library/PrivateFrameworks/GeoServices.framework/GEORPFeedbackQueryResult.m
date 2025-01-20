@interface GEORPFeedbackQueryResult
+ (BOOL)isValid:(id)a3;
+ (Class)feedbackInfoType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsResultTruncated;
- (BOOL)hasMaxResults;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResultTruncated;
- (BOOL)readFrom:(id)a3;
- (GEORPFeedbackQueryResult)initWithDictionary:(id)a3;
- (GEORPFeedbackQueryResult)initWithJSON:(id)a3;
- (NSMutableArray)feedbackInfos;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackInfoAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)feedbackInfosCount;
- (unint64_t)hash;
- (unsigned)maxResults;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addFeedbackInfo:(id)a3;
- (void)clearFeedbackInfos;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeedbackInfos:(id)a3;
- (void)setHasIsResultTruncated:(BOOL)a3;
- (void)setHasMaxResults:(BOOL)a3;
- (void)setIsResultTruncated:(BOOL)a3;
- (void)setMaxResults:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPFeedbackQueryResult

- (NSMutableArray)feedbackInfos
{
  return self->_feedbackInfos;
}

- (void)setFeedbackInfos:(id)a3
{
}

- (void)clearFeedbackInfos
{
}

- (void)addFeedbackInfo:(id)a3
{
  id v4 = a3;
  feedbackInfos = self->_feedbackInfos;
  id v8 = v4;
  if (!feedbackInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_feedbackInfos;
    self->_feedbackInfos = v6;

    id v4 = v8;
    feedbackInfos = self->_feedbackInfos;
  }
  [(NSMutableArray *)feedbackInfos addObject:v4];
}

- (unint64_t)feedbackInfosCount
{
  return [(NSMutableArray *)self->_feedbackInfos count];
}

- (id)feedbackInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_feedbackInfos objectAtIndex:a3];
}

+ (Class)feedbackInfoType
{
  return (Class)objc_opt_class();
}

- (unsigned)maxResults
{
  return self->_maxResults;
}

- (void)setMaxResults:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMaxResults
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)isResultTruncated
{
  return self->_isResultTruncated;
}

- (void)setIsResultTruncated:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isResultTruncated = a3;
}

- (void)setHasIsResultTruncated:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsResultTruncated
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPFeedbackQueryResult;
  id v4 = [(GEORPFeedbackQueryResult *)&v8 description];
  v5 = [(GEORPFeedbackQueryResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackQueryResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"feedbackInfo";
      }
      else {
        v13 = @"feedback_info";
      }
      [v4 setObject:v5 forKey:v13];
    }
    char v14 = *(unsigned char *)(a1 + 32);
    if (v14)
    {
      v15 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
      if (a2) {
        v16 = @"maxResults";
      }
      else {
        v16 = @"max_results";
      }
      [v4 setObject:v15 forKey:v16];

      char v14 = *(unsigned char *)(a1 + 32);
    }
    if ((v14 & 2) != 0)
    {
      v17 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 28)];
      if (a2) {
        v18 = @"isResultTruncated";
      }
      else {
        v18 = @"is_result_truncated";
      }
      [v4 setObject:v17 forKey:v18];
    }
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __54__GEORPFeedbackQueryResult__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEORPFeedbackQueryResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEORPFeedbackQueryResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackQueryResult)initWithDictionary:(id)a3
{
  return (GEORPFeedbackQueryResult *)-[GEORPFeedbackQueryResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"feedbackInfo";
      }
      else {
        id v6 = @"feedback_info";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v22 = v7;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v24 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v14 = [GEORPFeedbackInfo alloc];
                if (a3) {
                  uint64_t v15 = [(GEORPFeedbackInfo *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEORPFeedbackInfo *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addFeedbackInfo:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v10);
        }

        uint64_t v7 = v22;
      }

      if (a3) {
        v17 = @"maxResults";
      }
      else {
        v17 = @"max_results";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxResults:", objc_msgSend(v18, "unsignedIntValue"));
      }

      if (a3) {
        v19 = @"isResultTruncated";
      }
      else {
        v19 = @"is_result_truncated";
      }
      v20 = [v5 objectForKeyedSubscript:v19];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsResultTruncated:", objc_msgSend(v20, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPFeedbackQueryResult)initWithJSON:(id)a3
{
  return (GEORPFeedbackQueryResult *)-[GEORPFeedbackQueryResult _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackQueryResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackQueryResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_feedbackInfos;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteUint32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_feedbackInfos;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [(GEORPFeedbackQueryResult *)self readAll:0];
  if ([(GEORPFeedbackQueryResult *)self feedbackInfosCount])
  {
    [v9 clearFeedbackInfos];
    unint64_t v4 = [(GEORPFeedbackQueryResult *)self feedbackInfosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPFeedbackQueryResult *)self feedbackInfoAtIndex:i];
        [v9 addFeedbackInfo:v7];
      }
    }
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v9 + 6) = self->_maxResults;
    *((unsigned char *)v9 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v9 + 28) = self->_isResultTruncated;
    *((unsigned char *)v9 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_feedbackInfos;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (void)v14);
        [(id)v5 addFeedbackInfo:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 24) = self->_maxResults;
    *(unsigned char *)(v5 + 32) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 28) = self->_isResultTruncated;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEORPFeedbackQueryResult *)self readAll:1];
  [v4 readAll:1];
  feedbackInfos = self->_feedbackInfos;
  if ((unint64_t)feedbackInfos | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](feedbackInfos, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_maxResults != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_11;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0)
    {
LABEL_11:
      BOOL v6 = 0;
      goto LABEL_12;
    }
    if (self->_isResultTruncated)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }
LABEL_12:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPFeedbackQueryResult *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_feedbackInfos hash];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v4 = 2654435761 * self->_maxResults;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isResultTruncated;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEORPFeedbackQueryResult addFeedbackInfo:](self, "addFeedbackInfo:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 32);
  if (v10)
  {
    self->_maxResults = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_flags |= 1u;
    char v10 = *((unsigned char *)v4 + 32);
  }
  if ((v10 & 2) != 0)
  {
    self->_isResultTruncated = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_flags |= 2u;
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
    [(GEORPFeedbackQueryResult *)self readAll:0];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_feedbackInfos;
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
  objc_storeStrong((id *)&self->_feedbackInfos, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end