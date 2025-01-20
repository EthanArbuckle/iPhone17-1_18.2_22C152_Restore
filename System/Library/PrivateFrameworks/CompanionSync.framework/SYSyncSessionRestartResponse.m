@interface SYSyncSessionRestartResponse
- (BOOL)accepted;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sessionID;
- (SYErrorInfo)error;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccepted:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setHeader:(id)a3;
- (void)setSessionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYSyncSessionRestartResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYSyncSessionRestartResponse;
  v4 = [(SYSyncSessionRestartResponse *)&v8 description];
  v5 = [(SYSyncSessionRestartResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(SYMessageHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  v7 = [NSNumber numberWithBool:self->_accepted];
  [v3 setObject:v7 forKey:@"accepted"];

  error = self->_error;
  if (error)
  {
    v9 = [(SYErrorInfo *)error dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"error"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYSyncSessionRestartResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYSyncSessionRestartResponse writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_sessionID) {
    -[SYSyncSessionRestartResponse writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setHeader:self->_header];
  [v5 setSessionID:self->_sessionID];
  id v4 = v5;
  v5[32] = self->_accepted;
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_sessionID copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(unsigned char *)(v5 + 32) = self->_accepted;
  id v10 = [(SYErrorInfo *)self->_error copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:")) {
      goto LABEL_11;
    }
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (self->_accepted)
  {
    if (*((unsigned char *)v4 + 32)) {
      goto LABEL_8;
    }
LABEL_11:
    char v8 = 0;
    goto LABEL_12;
  }
  if (*((unsigned char *)v4 + 32)) {
    goto LABEL_11;
  }
LABEL_8:
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1)) {
    char v8 = -[SYErrorInfo isEqual:](error, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_sessionID hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_accepted;
  return v4 ^ [(SYErrorInfo *)self->_error hash] ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 2);
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
    -[SYSyncSessionRestartResponse setHeader:](self, "setHeader:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 3))
  {
    -[SYSyncSessionRestartResponse setSessionID:](self, "setSessionID:");
    id v4 = v9;
  }
  self->_accepted = *((unsigned char *)v4 + 32);
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
    error = (SYErrorInfo *)-[SYSyncSessionRestartResponse setError:](self, "setError:");
  }
  id v4 = v9;
LABEL_15:
  MEMORY[0x270F9A758](error, v4);
}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
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
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYSyncSessionRestartResponse writeTo:]", "SYSyncSessionRestartResponse.m", 132, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYSyncSessionRestartResponse writeTo:]", "SYSyncSessionRestartResponse.m", 137, "nil != self->_sessionID");
}

@end