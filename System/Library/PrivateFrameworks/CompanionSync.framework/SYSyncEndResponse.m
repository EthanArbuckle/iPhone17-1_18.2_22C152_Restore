@interface SYSyncEndResponse
- (BOOL)hasError;
- (BOOL)hasErrorResolution;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)syncID;
- (SYErrorInfo)error;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)errorResolutionAsString:(int)a3;
- (int)StringAsErrorResolution:(id)a3;
- (int)errorResolution;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setErrorResolution:(int)a3;
- (void)setHasErrorResolution:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setSyncID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYSyncEndResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (int)errorResolution
{
  if (*(unsigned char *)&self->_has) {
    return self->_errorResolution;
  }
  else {
    return 0;
  }
}

- (void)setErrorResolution:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorResolution = a3;
}

- (void)setHasErrorResolution:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorResolution
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)errorResolutionAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"Retry";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"Ignore";
  }
  return v4;
}

- (int)StringAsErrorResolution:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Ignore"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Retry"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYSyncEndResponse;
  int v4 = [(SYSyncEndResponse *)&v8 description];
  v5 = [(SYSyncEndResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(SYMessageHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  syncID = self->_syncID;
  if (syncID) {
    [v3 setObject:syncID forKey:@"syncID"];
  }
  error = self->_error;
  if (error)
  {
    objc_super v8 = [(SYErrorInfo *)error dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"error"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int errorResolution = self->_errorResolution;
    if (errorResolution)
    {
      if (errorResolution == 1)
      {
        v10 = @"Retry";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_errorResolution);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = @"Ignore";
    }
    [v3 setObject:v10 forKey:@"errorResolution"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYSyncEndResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYSyncEndResponse writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_syncID) {
    -[SYSyncEndResponse writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setHeader:self->_header];
  [v4 setSyncID:self->_syncID];
  if (self->_error) {
    objc_msgSend(v4, "setError:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_errorResolution;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_syncID copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(SYErrorInfo *)self->_error copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_errorResolution;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 3))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:")) {
      goto LABEL_12;
    }
  }
  syncID = self->_syncID;
  if ((unint64_t)syncID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](syncID, "isEqual:")) {
      goto LABEL_12;
    }
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1))
  {
    if (!-[SYErrorInfo isEqual:](error, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_errorResolution == *((_DWORD *)v4 + 4))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_syncID hash];
  unint64_t v5 = [(SYErrorInfo *)self->_error hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_errorResolution;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYMessageHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYSyncEndResponse setHeader:](self, "setHeader:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 4))
  {
    -[SYSyncEndResponse setSyncID:](self, "setSyncID:");
    id v4 = v9;
  }
  error = self->_error;
  uint64_t v8 = *((void *)v4 + 1);
  if (error)
  {
    if (!v8) {
      goto LABEL_15;
    }
    error = (SYErrorInfo *)-[SYErrorInfo mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    error = (SYErrorInfo *)-[SYSyncEndResponse setError:](self, "setError:");
  }
  id v4 = v9;
LABEL_15:
  if (*((unsigned char *)v4 + 40))
  {
    self->_int errorResolution = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758](error, v4);
}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
}

- (SYErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYSyncEndResponse writeTo:]", "SYSyncEndResponse.m", 161, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYSyncEndResponse writeTo:]", "SYSyncEndResponse.m", 166, "nil != self->_syncID");
}

@end