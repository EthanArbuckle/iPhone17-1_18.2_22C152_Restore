@interface GEORPProblemOptInResponse
+ (BOOL)isValid:(id)a3;
- (BOOL)hasStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPProblemOptInResponse)initWithDictionary:(id)a3;
- (GEORPProblemOptInResponse)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)statusCodeAsString:(int)a3;
- (int)StringAsStatusCode:(id)a3;
- (int)statusCode;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStatusCode:(BOOL)a3;
- (void)setStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPProblemOptInResponse

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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPProblemOptInResponse;
  int v4 = [(GEORPProblemOptInResponse *)&v8 description];
  v5 = [(GEORPProblemOptInResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemOptInResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      uint64_t v5 = *(unsigned int *)(a1 + 8);
      if ((int)v5 <= 29)
      {
        v6 = @"STATUS_SUCCESS";
        switch((int)v5)
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
      if ((int)v5 > 49)
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
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
  }
  else
  {
    int v4 = 0;
  }
LABEL_24:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPProblemOptInResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemOptInResponse)initWithDictionary:(id)a3
{
  return (GEORPProblemOptInResponse *)-[GEORPProblemOptInResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
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
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_30:

          goto LABEL_31;
        }
        uint64_t v9 = [v7 intValue];
      }
      [a1 setStatusCode:v9];
      goto LABEL_30;
    }
  }
LABEL_31:

  return a1;
}

- (GEORPProblemOptInResponse)initWithJSON:(id)a3
{
  return (GEORPProblemOptInResponse *)-[GEORPProblemOptInResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  objc_msgSend(a3, "length", objc_msgSend(a3, "position"));
  int v4 = (int *)MEMORY[0x1E4F940E8];
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
        uint64_t v12 = *(void *)((char *)a3 + v11);
        unint64_t v13 = v12 + 1;
        if (v12 == -1 || v13 > *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v7) + v12);
        *(void *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v16 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        if ((v10 & 7) != 0) {
          goto LABEL_33;
        }
        unsigned int v18 = 0;
        while (1)
        {
          uint64_t v19 = *v4;
          uint64_t v20 = *(void *)((char *)a3 + v19);
          unint64_t v21 = v20 + 1;
          if (v20 == -1 || v21 > *(void *)((char *)a3 + *v5)) {
            break;
          }
          int v22 = *(char *)(*(void *)((char *)a3 + *v7) + v20);
          *(void *)((char *)a3 + v19) = v21;
          if (v22 < 0 && v18++ <= 8) {
            continue;
          }
          goto LABEL_30;
        }
        *((unsigned char *)a3 + *v6) = 1;
      }
      else if (!PBReaderSkipValueWithTag())
      {
LABEL_33:
        BOOL v24 = 0;
        goto LABEL_32;
      }
LABEL_30:
      ;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  BOOL v24 = *((unsigned char *)a3 + *v6) == 0;
LABEL_32:
  PBReaderRecallMark();
  return v24;
}

- (BOOL)readFrom:(id)a3
{
  int v4 = (char *)a3;
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
          uint64_t v13 = *(void *)&v4[v12];
          unint64_t v14 = v13 + 1;
          if (v13 == -1 || v14 > *(void *)&v4[*v6]) {
            break;
          }
          char v15 = *(unsigned char *)(*(void *)&v4[*v8] + v13);
          *(void *)&v4[v12] = v14;
          v11 |= (unint64_t)(v15 & 0x7F) << v9;
          if ((v15 & 0x80) == 0) {
            goto LABEL_13;
          }
          v9 += 7;
          BOOL v16 = v10++ >= 9;
          if (v16)
          {
            unint64_t v11 = 0;
            int v17 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        int v17 = v4[*v7];
        if (v4[*v7]) {
          unint64_t v11 = 0;
        }
LABEL_15:
        if (v17 || (v11 & 7) == 4) {
          break;
        }
        if ((v11 >> 3) == 1)
        {
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          *(unsigned char *)&self->_flags |= 1u;
          while (1)
          {
            uint64_t v22 = *v5;
            uint64_t v23 = *(void *)&v4[v22];
            unint64_t v24 = v23 + 1;
            if (v23 == -1 || v24 > *(void *)&v4[*v6]) {
              break;
            }
            char v25 = *(unsigned char *)(*(void *)&v4[*v8] + v23);
            *(void *)&v4[v22] = v24;
            v21 |= (unint64_t)(v25 & 0x7F) << v19;
            if ((v25 & 0x80) == 0) {
              goto LABEL_30;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_32;
            }
          }
          v4[*v7] = 1;
LABEL_30:
          if (v4[*v7]) {
            LODWORD(v21) = 0;
          }
LABEL_32:
          self->_statusCode = v21;
        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_35;
        }
      }
      while (*(void *)&v4[*v5] < *(void *)&v4[*v6]);
    }
    BOOL v26 = v4[*v7] == 0;
  }
  else
  {
LABEL_35:
    BOOL v26 = 0;
  }
  objc_sync_exit(v4);

  return v26;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  [(GEORPProblemOptInResponse *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_statusCode;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_statusCode;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEORPProblemOptInResponse *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_statusCode == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_statusCode;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  [v4 readAll:0];
  if (v4[3])
  {
    self->_statusCode = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end