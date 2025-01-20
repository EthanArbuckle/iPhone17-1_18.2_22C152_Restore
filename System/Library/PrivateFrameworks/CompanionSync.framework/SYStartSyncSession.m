@interface SYStartSyncSession
- (BOOL)expectsRestartSupport;
- (BOOL)expectsRollbackSupport;
- (BOOL)hasMetadata;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResetSync;
- (BOOL)readFrom:(id)a3;
- (NSData)metadata;
- (NSString)reason;
- (NSString)sessionID;
- (SYMessageHeader)header;
- (double)sessionTimeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpectsRestartSupport:(BOOL)a3;
- (void)setExpectsRollbackSupport:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setIsResetSync:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setReason:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionTimeout:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYStartSyncSession

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYStartSyncSession;
  v4 = [(SYStartSyncSession *)&v8 description];
  v5 = [(SYStartSyncSession *)self dictionaryRepresentation];
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
  v6 = [NSNumber numberWithBool:self->_isResetSync];
  [v3 setObject:v6 forKey:@"isResetSync"];

  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  objc_super v8 = [NSNumber numberWithBool:self->_expectsRollbackSupport];
  [v3 setObject:v8 forKey:@"expectsRollbackSupport"];

  v9 = [NSNumber numberWithBool:self->_expectsRestartSupport];
  [v3 setObject:v9 forKey:@"expectsRestartSupport"];

  v10 = [NSNumber numberWithDouble:self->_sessionTimeout];
  [v3 setObject:v10 forKey:@"sessionTimeout"];

  metadata = self->_metadata;
  if (metadata) {
    [v3 setObject:metadata forKey:@"metadata"];
  }
  reason = self->_reason;
  if (reason) {
    [v3 setObject:reason forKey:@"reason"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYStartSyncSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYStartSyncSession writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  if (!self->_sessionID) {
    -[SYStartSyncSession writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteDoubleField();
  if (self->_metadata) {
    PBDataWriterWriteDataField();
  }
  if (self->_reason) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setHeader:self->_header];
  *((unsigned char *)v5 + 50) = self->_isResetSync;
  [v5 setSessionID:self->_sessionID];
  id v4 = v5;
  *((unsigned char *)v5 + 49) = self->_expectsRollbackSupport;
  *((unsigned char *)v5 + 48) = self->_expectsRestartSupport;
  *((void *)v5 + 1) = *(void *)&self->_sessionTimeout;
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    id v4 = v5;
  }
  if (self->_reason)
  {
    objc_msgSend(v5, "setReason:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(unsigned char *)(v5 + 50) = self->_isResetSync;
  uint64_t v8 = [(NSString *)self->_sessionID copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  *(unsigned char *)(v5 + 49) = self->_expectsRollbackSupport;
  *(unsigned char *)(v5 + 48) = self->_expectsRestartSupport;
  *(double *)(v5 + 8) = self->_sessionTimeout;
  uint64_t v10 = [(NSData *)self->_metadata copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_reason copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (self->_isResetSync)
  {
    if (!*((unsigned char *)v4 + 50)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 50))
  {
    goto LABEL_23;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 5) && !-[NSString isEqual:](sessionID, "isEqual:")) {
    goto LABEL_23;
  }
  if (self->_expectsRollbackSupport)
  {
    if (!*((unsigned char *)v4 + 49)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 49))
  {
    goto LABEL_23;
  }
  if (!self->_expectsRestartSupport)
  {
    if (!*((unsigned char *)v4 + 48)) {
      goto LABEL_18;
    }
LABEL_23:
    char v9 = 0;
    goto LABEL_24;
  }
  if (!*((unsigned char *)v4 + 48)) {
    goto LABEL_23;
  }
LABEL_18:
  if (self->_sessionTimeout != *((double *)v4 + 1)) {
    goto LABEL_23;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](metadata, "isEqual:")) {
      goto LABEL_23;
    }
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((void *)v4 + 4)) {
    char v9 = -[NSString isEqual:](reason, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  BOOL isResetSync = self->_isResetSync;
  NSUInteger v5 = [(NSString *)self->_sessionID hash];
  BOOL expectsRollbackSupport = self->_expectsRollbackSupport;
  BOOL expectsRestartSupport = self->_expectsRestartSupport;
  double sessionTimeout = self->_sessionTimeout;
  double v9 = -sessionTimeout;
  if (sessionTimeout >= 0.0) {
    double v9 = self->_sessionTimeout;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  double v12 = fmod(v10, 1.84467441e19);
  unint64_t v13 = 2654435761u * (unint64_t)v12;
  unint64_t v14 = v13 + (unint64_t)v11;
  if (v11 <= 0.0) {
    unint64_t v14 = 2654435761u * (unint64_t)v12;
  }
  unint64_t v15 = v13 - (unint64_t)fabs(v11);
  if (v11 >= 0.0) {
    unint64_t v15 = v14;
  }
  uint64_t v16 = (2654435761 * isResetSync) ^ v3 ^ v5;
  uint64_t v17 = (2654435761 * expectsRollbackSupport) ^ (2654435761 * expectsRestartSupport) ^ v15;
  uint64_t v18 = v16 ^ [(NSData *)self->_metadata hash];
  return v18 ^ [(NSString *)self->_reason hash] ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 2);
  id v7 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    header = (SYMessageHeader *)-[SYMessageHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    header = (SYMessageHeader *)-[SYStartSyncSession setHeader:](self, "setHeader:");
  }
  id v4 = v7;
LABEL_7:
  self->_BOOL isResetSync = *((unsigned char *)v4 + 50);
  if (*((void *)v4 + 5))
  {
    header = (SYMessageHeader *)-[SYStartSyncSession setSessionID:](self, "setSessionID:");
    id v4 = v7;
  }
  self->_BOOL expectsRollbackSupport = *((unsigned char *)v4 + 49);
  self->_BOOL expectsRestartSupport = *((unsigned char *)v4 + 48);
  self->_double sessionTimeout = *((double *)v4 + 1);
  if (*((void *)v4 + 3))
  {
    header = (SYMessageHeader *)-[SYStartSyncSession setMetadata:](self, "setMetadata:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    header = (SYMessageHeader *)-[SYStartSyncSession setReason:](self, "setReason:");
    id v4 = v7;
  }
  MEMORY[0x270F9A758](header, v4);
}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (BOOL)isResetSync
{
  return self->_isResetSync;
}

- (void)setIsResetSync:(BOOL)a3
{
  self->_BOOL isResetSync = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (BOOL)expectsRollbackSupport
{
  return self->_expectsRollbackSupport;
}

- (void)setExpectsRollbackSupport:(BOOL)a3
{
  self->_BOOL expectsRollbackSupport = a3;
}

- (BOOL)expectsRestartSupport
{
  return self->_expectsRestartSupport;
}

- (void)setExpectsRestartSupport:(BOOL)a3
{
  self->_BOOL expectsRestartSupport = a3;
}

- (double)sessionTimeout
{
  return self->_sessionTimeout;
}

- (void)setSessionTimeout:(double)a3
{
  self->_double sessionTimeout = a3;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYStartSyncSession writeTo:]", "SYStartSyncSession.m", 155, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYStartSyncSession writeTo:]", "SYStartSyncSession.m", 164, "nil != self->_sessionID");
}

@end