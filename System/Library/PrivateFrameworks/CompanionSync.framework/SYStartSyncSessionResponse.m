@interface SYStartSyncSessionResponse
- (BOOL)accepted;
- (BOOL)hasError;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsRestart;
- (BOOL)supportsRollback;
- (NSData)metadata;
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
- (void)setMetadata:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSupportsRestart:(BOOL)a3;
- (void)setSupportsRollback:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYStartSyncSessionResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYStartSyncSessionResponse;
  v4 = [(SYStartSyncSessionResponse *)&v8 description];
  v5 = [(SYStartSyncSessionResponse *)self dictionaryRepresentation];
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
  v10 = [NSNumber numberWithBool:self->_supportsRollback];
  [v3 setObject:v10 forKey:@"supportsRollback"];

  v11 = [NSNumber numberWithBool:self->_supportsRestart];
  [v3 setObject:v11 forKey:@"supportsRestart"];

  metadata = self->_metadata;
  if (metadata) {
    [v3 setObject:metadata forKey:@"metadata"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYStartSyncSessionResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYStartSyncSessionResponse writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_sessionID) {
    -[SYStartSyncSessionResponse writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  if (self->_metadata) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setHeader:self->_header];
  [v5 setSessionID:self->_sessionID];
  id v4 = v5;
  v5[40] = self->_accepted;
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
  v4[42] = self->_supportsRollback;
  v4[41] = self->_supportsRestart;
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
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
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  *(unsigned char *)(v5 + 40) = self->_accepted;
  id v10 = [(SYErrorInfo *)self->_error copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  *(unsigned char *)(v5 + 42) = self->_supportsRollback;
  *(unsigned char *)(v5 + 41) = self->_supportsRestart;
  uint64_t v12 = [(NSData *)self->_metadata copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:")) {
      goto LABEL_21;
    }
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (self->_accepted)
  {
    if (!*((unsigned char *)v4 + 40)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_21;
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1) && !-[SYErrorInfo isEqual:](error, "isEqual:")) {
    goto LABEL_21;
  }
  if (self->_supportsRollback)
  {
    if (!*((unsigned char *)v4 + 42)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 42))
  {
    goto LABEL_21;
  }
  if (self->_supportsRestart)
  {
    if (*((unsigned char *)v4 + 41)) {
      goto LABEL_18;
    }
LABEL_21:
    char v9 = 0;
    goto LABEL_22;
  }
  if (*((unsigned char *)v4 + 41)) {
    goto LABEL_21;
  }
LABEL_18:
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 3)) {
    char v9 = -[NSData isEqual:](metadata, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_sessionID hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_accepted;
  unint64_t v6 = v4 ^ [(SYErrorInfo *)self->_error hash] ^ v5 ^ (2654435761 * self->_supportsRollback) ^ (2654435761 * self->_supportsRestart);
  return v6 ^ [(NSData *)self->_metadata hash];
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
    -[SYStartSyncSessionResponse setHeader:](self, "setHeader:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 4))
  {
    -[SYStartSyncSessionResponse setSessionID:](self, "setSessionID:");
    id v4 = v9;
  }
  self->_accepted = *((unsigned char *)v4 + 40);
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
    error = (SYErrorInfo *)-[SYStartSyncSessionResponse setError:](self, "setError:");
  }
  id v4 = v9;
LABEL_15:
  self->_supportsRollback = *((unsigned char *)v4 + 42);
  self->_supportsRestart = *((unsigned char *)v4 + 41);
  if (*((void *)v4 + 3))
  {
    error = (SYErrorInfo *)-[SYStartSyncSessionResponse setMetadata:](self, "setMetadata:");
    id v4 = v9;
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

- (BOOL)supportsRollback
{
  return self->_supportsRollback;
}

- (void)setSupportsRollback:(BOOL)a3
{
  self->_supportsRollback = a3;
}

- (BOOL)supportsRestart
{
  return self->_supportsRestart;
}

- (void)setSupportsRestart:(BOOL)a3
{
  self->_supportsRestart = a3;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYStartSyncSessionResponse writeTo:]", "SYStartSyncSessionResponse.m", 161, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYStartSyncSessionResponse writeTo:]", "SYStartSyncSessionResponse.m", 166, "nil != self->_sessionID");
}

@end