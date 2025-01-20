@interface GEORPProblemStatusResponse
+ (BOOL)isValid:(id)a3;
+ (Class)problemStatusType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPProblemStatusResponse)initWithDictionary:(id)a3;
- (GEORPProblemStatusResponse)initWithJSON:(id)a3;
- (NSMutableArray)problemStatus;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)problemStatusAtIndex:(unint64_t)a3;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (unint64_t)hash;
- (unint64_t)problemStatusCount;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)addProblemStatus:(id)a3;
- (void)clearProblemStatus;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setProblemStatus:(id)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemStatusResponse

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

- (NSMutableArray)problemStatus
{
  return self->_problemStatus;
}

- (void)setProblemStatus:(id)a3
{
}

- (void)clearProblemStatus
{
}

- (void)addProblemStatus:(id)a3
{
  id v4 = a3;
  problemStatus = self->_problemStatus;
  id v8 = v4;
  if (!problemStatus)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_problemStatus;
    self->_problemStatus = v6;

    id v4 = v8;
    problemStatus = self->_problemStatus;
  }
  [(NSMutableArray *)problemStatus addObject:v4];
}

- (unint64_t)problemStatusCount
{
  return [(NSMutableArray *)self->_problemStatus count];
}

- (id)problemStatusAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_problemStatus objectAtIndex:a3];
}

+ (Class)problemStatusType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemStatusResponse;
  id v4 = [(GEORPProblemStatusResponse *)&v8 description];
  v5 = [(GEORPProblemStatusResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemStatusResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_39;
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
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = *(id *)(a1 + 8);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    if (a2) {
      v16 = @"problemStatus";
    }
    else {
      v16 = @"problem_status";
    }
    [v4 setObject:v8 forKey:v16];
  }
LABEL_39:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemStatusResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemStatusResponse)initWithDictionary:(id)a3
{
  return (GEORPProblemStatusResponse *)-[GEORPProblemStatusResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_48;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_48;
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

  if (a3) {
    uint64_t v10 = @"problemStatus";
  }
  else {
    uint64_t v10 = @"problem_status";
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v5;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v18 = [GEORPProblemStatus alloc];
            if (a3) {
              uint64_t v19 = [(GEORPProblemStatus *)v18 initWithJSON:v17];
            }
            else {
              uint64_t v19 = [(GEORPProblemStatus *)v18 initWithDictionary:v17];
            }
            long long v20 = (void *)v19;
            [a1 addProblemStatus:v19];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    id v5 = v22;
  }

LABEL_48:
  return a1;
}

- (GEORPProblemStatusResponse)initWithJSON:(id)a3
{
  return (GEORPProblemStatusResponse *)-[GEORPProblemStatusResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemStatusResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemStatusResponseReadAllFrom((uint64_t)self, a3, 0);
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
  id v5 = self->_problemStatus;
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

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_problemStatus;
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
  [(GEORPProblemStatusResponse *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v8[4] = self->_statusCode;
    *((unsigned char *)v8 + 20) |= 1u;
  }
  if ([(GEORPProblemStatusResponse *)self problemStatusCount])
  {
    [v8 clearProblemStatus];
    unint64_t v4 = [(GEORPProblemStatusResponse *)self problemStatusCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPProblemStatusResponse *)self problemStatusAtIndex:i];
        [v8 addProblemStatus:v7];
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
  uint64_t v7 = self->_problemStatus;
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
        [v6 addProblemStatus:v12];

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
  [(GEORPProblemStatusResponse *)self readAll:1];
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
  problemStatus = self->_problemStatus;
  if ((unint64_t)problemStatus | *((void *)v4 + 1)) {
    char v6 = -[NSMutableArray isEqual:](problemStatus, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPProblemStatusResponse *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(NSMutableArray *)self->_problemStatus hash] ^ v3;
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
        -[GEORPProblemStatusResponse addProblemStatus:](self, "addProblemStatus:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
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