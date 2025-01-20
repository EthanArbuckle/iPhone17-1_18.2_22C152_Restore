@interface SYSyncBatchResponse
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
- (unint64_t)index;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setHeader:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setSessionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYSyncBatchResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYSyncBatchResponse;
  v4 = [(SYSyncBatchResponse *)&v8 description];
  v5 = [(SYSyncBatchResponse *)self dictionaryRepresentation];
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
  v7 = [NSNumber numberWithUnsignedLongLong:self->_index];
  [v3 setObject:v7 forKey:@"index"];

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
  return SYSyncBatchResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYSyncBatchResponse writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_sessionID) {
    -[SYSyncBatchResponse writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint64Field();
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
  v5[1] = self->_index;
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_sessionID copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  v5[1] = self->_index;
  id v10 = [(SYErrorInfo *)self->_error copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[3])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((sessionID = self->_sessionID, !((unint64_t)sessionID | v4[4]))
     || -[NSString isEqual:](sessionID, "isEqual:"))
    && self->_index == v4[1])
  {
    error = self->_error;
    if ((unint64_t)error | v4[2]) {
      char v8 = -[SYErrorInfo isEqual:](error, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_sessionID hash] ^ v3;
  unint64_t v5 = 2654435761u * self->_index;
  return v4 ^ [(SYErrorInfo *)self->_error hash] ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (unint64_t *)a3;
  header = self->_header;
  unint64_t v6 = v4[3];
  v9 = v4;
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
    -[SYSyncBatchResponse setHeader:](self, "setHeader:");
  }
  NSUInteger v4 = v9;
LABEL_7:
  if (v4[4])
  {
    -[SYSyncBatchResponse setSessionID:](self, "setSessionID:");
    NSUInteger v4 = v9;
  }
  self->_index = v4[1];
  error = self->_error;
  unint64_t v8 = v4[2];
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
    error = (SYErrorInfo *)-[SYSyncBatchResponse setError:](self, "setError:");
  }
  NSUInteger v4 = v9;
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

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
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
  __assert_rtn("-[SYSyncBatchResponse writeTo:]", "SYSyncBatchResponse.m", 132, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYSyncBatchResponse writeTo:]", "SYSyncBatchResponse.m", 137, "nil != self->_sessionID");
}

@end