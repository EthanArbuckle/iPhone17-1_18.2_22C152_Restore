@interface GEOSpatialLookupBatchResponse
+ (BOOL)isValid:(id)a3;
+ (Class)responseType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSpatialLookupBatchResponse)initWithDictionary:(id)a3;
- (GEOSpatialLookupBatchResponse)initWithJSON:(id)a3;
- (NSMutableArray)responses;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)responseAtIndex:(unint64_t)a3;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (unint64_t)hash;
- (unint64_t)responsesCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addResponse:(id)a3;
- (void)clearResponses;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setResponses:(id)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSpatialLookupBatchResponse

- (int)statusCode
{
  if (*(unsigned char *)&self->_flags) {
    return self->_statusCode;
  }
  else {
    return 0;
  }
}

- (void)setStatusCode:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_statusCode = a3;
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasStatusCode
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)statusCodeAsString:(int)a3
{
  if (a3 <= 29)
  {
    v4 = @"STATUS_SUCCESS";
    switch(a3)
    {
      case 0:
        goto LABEL_22;
      case 1:
        v4 = @"STATUS_FAILED";
        break;
      case 2:
        v4 = @"STATUS_INCOMPLETE";
        break;
      case 3:
      case 4:
        goto LABEL_21;
      case 5:
        v4 = @"INVALID_REQUEST";
        break;
      default:
        if (a3 != 20) {
          goto LABEL_21;
        }
        v4 = @"FAILED_NO_RESULT";
        break;
    }
    return v4;
  }
  if (a3 > 49)
  {
    if (a3 == 50)
    {
      v4 = @"STATUS_DEDUPED";
    }
    else
    {
      if (a3 != 60) {
        goto LABEL_21;
      }
      v4 = @"VERSION_MISMATCH";
    }
  }
  else
  {
    if (a3 != 30)
    {
      if (a3 == 40)
      {
        v4 = @"FAILED_NOT_AUTHORIZED";
        return v4;
      }
LABEL_21:
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      return v4;
    }
    v4 = @"NEEDS_REFINEMENT";
  }
  return v4;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"STATUS_SUCCESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STATUS_FAILED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STATUS_INCOMPLETE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALID_REQUEST"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAILED_NO_RESULT"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"NEEDS_REFINEMENT"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"STATUS_DEDUPED"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"VERSION_MISMATCH"])
  {
    int v4 = 60;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSMutableArray)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (void)clearResponses
{
}

- (void)addResponse:(id)a3
{
  id v4 = a3;
  responses = self->_responses;
  id v8 = v4;
  if (!responses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_responses;
    self->_responses = v6;

    id v4 = v8;
    responses = self->_responses;
  }
  [(NSMutableArray *)responses addObject:v4];
}

- (unint64_t)responsesCount
{
  return [(NSMutableArray *)self->_responses count];
}

- (id)responseAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_responses objectAtIndex:a3];
}

+ (Class)responseType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSpatialLookupBatchResponse;
  id v4 = [(GEOSpatialLookupBatchResponse *)&v8 description];
  v5 = [(GEOSpatialLookupBatchResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSpatialLookupBatchResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_36;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 20))
  {
    int v5 = *(_DWORD *)(a1 + 16);
    if (v5 <= 29)
    {
      v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v6 = @"STATUS_FAILED";
          break;
        case 2:
          v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        if (a2) {
          v7 = @"statusCode";
        }
        else {
          v7 = @"status_code";
        }
        [v4 setObject:v6 forKey:v7];

        goto LABEL_24;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_24:
  if ([*(id *)(a1 + 8) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = *(id *)(a1 + 8);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"response"];
  }
LABEL_36:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSpatialLookupBatchResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOSpatialLookupBatchResponse)initWithDictionary:(id)a3
{
  return (GEOSpatialLookupBatchResponse *)-[GEOSpatialLookupBatchResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_45;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_45;
  }
  if (a3) {
    v6 = @"statusCode";
  }
  else {
    v6 = @"status_code";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"STATUS_SUCCESS"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"STATUS_FAILED"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"INVALID_REQUEST"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FAILED_NO_RESULT"])
    {
      uint64_t v9 = 20;
    }
    else if ([v8 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      uint64_t v9 = 30;
    }
    else if ([v8 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      uint64_t v9 = 40;
    }
    else if ([v8 isEqualToString:@"STATUS_DEDUPED"])
    {
      uint64_t v9 = 50;
    }
    else if ([v8 isEqualToString:@"VERSION_MISMATCH"])
    {
      uint64_t v9 = 60;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_29:
    [a1 setStatusCode:v9];
  }

  uint64_t v10 = [v5 objectForKeyedSubscript:@"response"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v5;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
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
            long long v17 = [GEOSpatialLookupResponse alloc];
            if (a3) {
              uint64_t v18 = [(GEOSpatialLookupResponse *)v17 initWithJSON:v16];
            }
            else {
              uint64_t v18 = [(GEOSpatialLookupResponse *)v17 initWithDictionary:v16];
            }
            long long v19 = (void *)v18;
            [a1 addResponse:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    id v5 = v21;
  }

LABEL_45:
  return a1;
}

- (GEOSpatialLookupBatchResponse)initWithJSON:(id)a3
{
  return (GEOSpatialLookupBatchResponse *)-[GEOSpatialLookupBatchResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  [a3 position];
  [a3 length];
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v4;
        unint64_t v12 = *(void *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      int v16 = v10 & 7;
      if (v15 || v16 == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        if (v16 != 2 || !PBReaderPlaceMark() || !GEOSpatialLookupResponseIsValid((char *)a3))
        {
LABEL_38:
          PBReaderRecallMark();
          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1)
      {
        if ((v10 & 7) != 0) {
          goto LABEL_38;
        }
        unsigned int v18 = 0;
        while (1)
        {
          uint64_t v19 = *v4;
          unint64_t v20 = *(void *)((char *)a3 + v19);
          if (v20 == -1 || v20 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          unint64_t v21 = v20 + 1;
          int v22 = *(char *)(*(void *)((char *)a3 + *v7) + v20);
          *(void *)((char *)a3 + v19) = v21;
          if (v22 < 0 && v18++ <= 8) {
            continue;
          }
          goto LABEL_35;
        }
        *((unsigned char *)a3 + *v6) = 1;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_38;
      }
LABEL_35:
      ;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  BOOL v24 = *((unsigned char *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v24;
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    id v5 = (int *)MEMORY[0x1E4F940E8];
    v6 = (int *)MEMORY[0x1E4F940E0];
    v7 = (int *)MEMORY[0x1E4F940C8];
    if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
    {
      char v8 = (int *)MEMORY[0x1E4F940B8];
      do
      {
        if (v4[*v7]) {
          break;
        }
        char v9 = 0;
        unsigned int v10 = 0;
        unint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = *v5;
          unint64_t v13 = *(void *)&v4[v12];
          if (v13 == -1 || v13 >= *(void *)&v4[*v6]) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
          *(void *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0) {
            goto LABEL_13;
          }
          v9 += 7;
          BOOL v15 = v10++ >= 9;
          if (v15)
          {
            unint64_t v11 = 0;
            int v16 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        int v16 = v4[*v7];
        if (v4[*v7]) {
          unint64_t v11 = 0;
        }
LABEL_15:
        if (v16 || (v11 & 7) == 4) {
          break;
        }
        if ((v11 >> 3) == 2)
        {
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_40;
          }
          BOOL v24 = objc_alloc_init(GEOSpatialLookupResponse);
          if (!GEOSpatialLookupResponseReadAllFrom((uint64_t)v24, v4))
          {

            goto LABEL_40;
          }
          PBReaderRecallMark();
          -[GEOSpatialLookupBatchResponse addResponse:](self, "addResponse:", v24, 0, 0);
        }
        else if ((v11 >> 3) == 1)
        {
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)&self->_flags |= 1u;
          while (1)
          {
            uint64_t v21 = *v5;
            unint64_t v22 = *(void *)&v4[v21];
            if (v22 == -1 || v22 >= *(void *)&v4[*v6]) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)&v4[*v8] + v22);
            *(void *)&v4[v21] = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_34;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_36;
            }
          }
          v4[*v7] = 1;
LABEL_34:
          if (v4[*v7]) {
            LODWORD(v20) = 0;
          }
LABEL_36:
          self->_statusCode = v20;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_40;
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v25 = v4[*v7] == 0;
  }
  else
  {
LABEL_40:
    BOOL v25 = 0;
  }
  objc_sync_exit(v4);

  return v25;
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
  id v5 = self->_responses;
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

- (void)clearSensitiveFields:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_responses count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(NSMutableArray *)self->_responses objectAtIndexedSubscript:v5];
      uint64_t v7 = v6;
      if (v6)
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        uint64_t v8 = objc_msgSend(v6, "places", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v15;
          while (2)
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              if (GEOPDPlaceHasSensitiveFields(*(void **)(*((void *)&v14 + 1) + 8 * v12), a3))
              {

                long long v13 = (void *)[v7 copy];
                GEOSpatialLookupResponseClearSensitiveFields((uint64_t)v13, a3, 0);
                [(NSMutableArray *)self->_responses replaceObjectAtIndex:v5 withObject:v13];

                goto LABEL_15;
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      [v7 clearSensitiveFields:a3];
LABEL_15:

      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_responses count]);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_responses;
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
  uint64_t v8 = a3;
  [(GEOSpatialLookupBatchResponse *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v8[4] = self->_statusCode;
    *((unsigned char *)v8 + 20) |= 1u;
  }
  if ([(GEOSpatialLookupBatchResponse *)self responsesCount])
  {
    [v8 clearResponses];
    unint64_t v4 = [(GEOSpatialLookupBatchResponse *)self responsesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOSpatialLookupBatchResponse *)self responseAtIndex:i];
        [v8 addResponse:v7];
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
    *(_DWORD *)(v5 + 16) = self->_statusCode;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_responses;
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
        [v6 addResponse:v12];

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
  [(GEOSpatialLookupBatchResponse *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  responses = self->_responses;
  if ((unint64_t)responses | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](responses, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEOSpatialLookupBatchResponse *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSMutableArray *)self->_responses hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 20))
  {
    self->_statusCode = *((_DWORD *)v4 + 4);
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
        -[GEOSpatialLookupBatchResponse addResponse:](self, "addResponse:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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