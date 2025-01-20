@interface TASKResponse
- (BOOL)hasErrorMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unsigned)taskId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTaskId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKResponse

- (id)statusAsString:(int)a3
{
  if (a3 >= 5)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_10012AF90[a3];
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Ok"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Disabled"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NotReady"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LimitReached"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"InvalidInput"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TASKResponse;
  id v3 = [(TASKResponse *)&v7 description];
  int v4 = [(TASKResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t status = self->_status;
  if (status >= 5)
  {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_status];
  }
  else
  {
    v5 = off_10012AF90[status];
  }
  [v3 setObject:v5 forKey:@"status"];

  v6 = +[NSNumber numberWithUnsignedInt:self->_taskId];
  [v3 setObject:v6 forKey:@"taskId"];

  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [v3 setObject:errorMessage forKey:@"errorMessage"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004B518((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  if (self->_errorMessage) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_status;
  *((_DWORD *)a3 + 5) = self->_taskId;
  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [a3 setErrorMessage:errorMessage];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[4] = self->_status;
  v5[5] = self->_taskId;
  id v6 = [(NSString *)self->_errorMessage copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_status == *((_DWORD *)v4 + 4)
    && self->_taskId == *((_DWORD *)v4 + 5))
  {
    errorMessage = self->_errorMessage;
    if ((unint64_t)errorMessage | v4[1]) {
      unsigned __int8 v6 = -[NSString isEqual:](errorMessage, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_status;
  uint64_t v3 = 2654435761 * self->_taskId;
  return v3 ^ [(NSString *)self->_errorMessage hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t status = *((_DWORD *)a3 + 4);
  self->_taskId = *((_DWORD *)a3 + 5);
  if (*((void *)a3 + 1)) {
    -[TASKResponse setErrorMessage:](self, "setErrorMessage:");
  }
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_uint64_t status = a3;
}

- (unsigned)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(unsigned int)a3
{
  self->_taskId = a3;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end