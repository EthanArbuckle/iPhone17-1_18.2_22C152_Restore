@interface ModelKeyServerAPIFetchKeyResponse
- (BOOL)hasError;
- (BOOL)hasResult;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ModelKeyServerAPIFetchKeyResult)success;
- (ModelKeyServerAPIResultError)error;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
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

- (BOOL)hasSuccess
{
  return self->_success != 0;
}

- (void)setSuccess:(id)a3
{
  v4 = (ModelKeyServerAPIFetchKeyResult *)a3;
  [(ModelKeyServerAPIFetchKeyResponse *)self clearOneofValuesForResult];
  *(unsigned char *)&self->_has |= 1u;
  self->_result = 1;
  success = self->_success;
  self->_success = v4;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setError:(id)a3
{
  v4 = (ModelKeyServerAPIResultError *)a3;
  [(ModelKeyServerAPIFetchKeyResponse *)self clearOneofValuesForResult];
  *(unsigned char *)&self->_has |= 1u;
  self->_result = 2;
  error = self->_error;
  self->_error = v4;
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

- (void)setResult:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResult
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)resultAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_100010360[a3];
  }

  return v3;
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

- (void)clearOneofValuesForResult
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_result = 0;
  success = self->_success;
  self->_success = 0;

  error = self->_error;
  self->_error = 0;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)ModelKeyServerAPIFetchKeyResponse;
  id v3 = [(ModelKeyServerAPIFetchKeyResponse *)&v7 description];
  int v4 = [(ModelKeyServerAPIFetchKeyResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  success = self->_success;
  if (success)
  {
    v5 = [(ModelKeyServerAPIFetchKeyResult *)success dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"success"];
  }
  error = self->_error;
  if (error)
  {
    objc_super v7 = [(ModelKeyServerAPIResultError *)error dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"error"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = self->_result;
    if (v8 >= 3)
    {
      v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_result];
    }
    else
    {
      v9 = off_100010360[v8];
    }
    [v3 setObject:v9 forKey:@"Result"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ModelKeyServerAPIFetchKeyResponseReadFrom((uint64_t)self, (uint64_t)a3);
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

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_result;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v5 = v4;
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

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_result;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v7 = [(ModelKeyServerAPIFetchKeyResult *)self->_success copyWithZone:a3];
  uint64_t v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(ModelKeyServerAPIResultError *)self->_error copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
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
    unsigned __int8 v7 = 0;
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
    unsigned __int8 v7 = -[ModelKeyServerAPIResultError isEqual:](error, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
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

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[8])
  {
    self->_result = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  success = self->_success;
  uint64_t v7 = *((void *)v5 + 3);
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
  id v5 = v10;
LABEL_9:
  error = self->_error;
  uint64_t v9 = *((void *)v5 + 1);
  if (error)
  {
    if (v9) {
      -[ModelKeyServerAPIResultError mergeFrom:](error, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[ModelKeyServerAPIFetchKeyResponse setError:](self, "setError:");
  }

  _objc_release_x1();
}

- (ModelKeyServerAPIFetchKeyResult)success
{
  return self->_success;
}

- (ModelKeyServerAPIResultError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_success, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end