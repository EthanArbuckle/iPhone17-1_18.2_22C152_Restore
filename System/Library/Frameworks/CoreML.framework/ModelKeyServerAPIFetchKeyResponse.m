@interface ModelKeyServerAPIFetchKeyResponse
- (BOOL)hasError;
- (BOOL)hasResult;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ModelKeyServerAPIFetchKeyResult)success;
- (ModelKeyServerAPIResultError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)resultAsString:(int)a3;
- (int)StringAsResult:(id)a3;
- (int)result;
- (unint64_t)hash;
- (void)clearOneofValuesForResult;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setResult:(int)a3;
- (void)setSuccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ModelKeyServerAPIFetchKeyResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_success, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (ModelKeyServerAPIResultError)error
{
  return self->_error;
}

- (ModelKeyServerAPIFetchKeyResult)success
{
  return self->_success;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 32))
  {
    self->_result = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  success = self->_success;
  uint64_t v7 = v5[3];
  v10 = v5;
  if (success)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ModelKeyServerAPIFetchKeyResult mergeFrom:](success, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[ModelKeyServerAPIFetchKeyResponse setSuccess:](self, "setSuccess:");
  }
  v5 = v10;
LABEL_9:
  error = self->_error;
  uint64_t v9 = v5[1];
  if (error)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[ModelKeyServerAPIResultError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[ModelKeyServerAPIFetchKeyResponse setError:](self, "setError:");
  }
  v5 = v10;
LABEL_15:
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_result;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(ModelKeyServerAPIFetchKeyResult *)self->_success hash] ^ v3;
  return v4 ^ [(ModelKeyServerAPIResultError *)self->_error hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_result != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  success = self->_success;
  if ((unint64_t)success | *((void *)v4 + 3)
    && !-[ModelKeyServerAPIFetchKeyResult isEqual:](success, "isEqual:"))
  {
    goto LABEL_11;
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1)) {
    char v7 = -[ModelKeyServerAPIResultError isEqual:](error, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_result;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v7 = [(ModelKeyServerAPIFetchKeyResult *)self->_success copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(ModelKeyServerAPIResultError *)self->_error copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_result;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_success)
  {
    objc_msgSend(v4, "setSuccess:");
    id v4 = v5;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_success)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 2)
      {
        [(ModelKeyServerAPIFetchKeyResponse *)self clearOneofValuesForResult];
        *(unsigned char *)&self->_has |= 1u;
        self->_result = 2;
        v25 = objc_alloc_init(ModelKeyServerAPIResultError);
        objc_storeStrong((id *)&self->_error, v25);
        if (!PBReaderPlaceMark()
          || (ModelKeyServerAPIResultErrorReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0)
        {
LABEL_39:

          LOBYTE(v26) = 0;
          return v26;
        }
      }
      else
      {
        if (v18 != 1)
        {
          if (v18)
          {
            int v26 = PBReaderSkipValueWithTag();
            if (!v26) {
              return v26;
            }
          }
          else
          {
            unsigned int v19 = 0;
            while (1)
            {
              uint64_t v20 = *v4;
              unint64_t v21 = *(void *)((char *)a3 + v20);
              if (v21 == -1 || v21 >= *(void *)((char *)a3 + *v5)) {
                break;
              }
              unint64_t v22 = v21 + 1;
              int v23 = *(char *)(*(void *)((char *)a3 + *v8) + v21);
              *(void *)((char *)a3 + v20) = v22;
              if (v23 < 0 && v19++ <= 8) {
                continue;
              }
              goto LABEL_37;
            }
            *((unsigned char *)a3 + *v6) = 1;
          }
          continue;
        }
        [(ModelKeyServerAPIFetchKeyResponse *)self clearOneofValuesForResult];
        *(unsigned char *)&self->_has |= 1u;
        self->_result = 1;
        v25 = objc_alloc_init(ModelKeyServerAPIFetchKeyResult);
        objc_storeStrong((id *)&self->_success, v25);
        if (!PBReaderPlaceMark()
          || (ModelKeyServerAPIFetchKeyResultReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0)
        {
          goto LABEL_39;
        }
      }
      PBReaderRecallMark();

LABEL_37:
      ;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v26) = *((unsigned char *)a3 + *v6) == 0;
  return v26;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  success = self->_success;
  if (success)
  {
    id v5 = [(ModelKeyServerAPIFetchKeyResult *)success dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"success"];
  }
  error = self->_error;
  if (error)
  {
    id v7 = [(ModelKeyServerAPIResultError *)error dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"error"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = self->_result;
    if (v8 >= 3)
    {
      char v9 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_result);
    }
    else
    {
      char v9 = (void *)*((void *)&off_1E59A3FD8 + v8);
    }
    [v3 setObject:v9 forKey:@"Result"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ModelKeyServerAPIFetchKeyResponse;
  id v4 = [(ModelKeyServerAPIFetchKeyResponse *)&v8 description];
  id v5 = [(ModelKeyServerAPIFetchKeyResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)clearOneofValuesForResult
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_result = 0;
  success = self->_success;
  self->_success = 0;

  error = self->_error;
  self->_error = 0;
}

- (int)StringAsResult:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"success"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"error"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)resultAsString:(int)a3
{
  if (a3 >= 3)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = (void *)*((void *)&off_1E59A3FD8 + a3);
  }

  return v3;
}

- (BOOL)hasResult
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasResult:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setResult:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_result = a3;
}

- (int)result
{
  if (*(unsigned char *)&self->_has) {
    return self->_result;
  }
  else {
    return 0;
  }
}

- (void)setError:(id)a3
{
  int v4 = (ModelKeyServerAPIResultError *)a3;
  [(ModelKeyServerAPIFetchKeyResponse *)self clearOneofValuesForResult];
  *(unsigned char *)&self->_has |= 1u;
  self->_result = 2;
  error = self->_error;
  self->_error = v4;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setSuccess:(id)a3
{
  int v4 = (ModelKeyServerAPIFetchKeyResult *)a3;
  [(ModelKeyServerAPIFetchKeyResponse *)self clearOneofValuesForResult];
  *(unsigned char *)&self->_has |= 1u;
  self->_result = 1;
  success = self->_success;
  self->_success = v4;
}

- (BOOL)hasSuccess
{
  return self->_success != 0;
}

@end