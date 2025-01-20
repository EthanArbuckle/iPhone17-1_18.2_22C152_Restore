@interface SYEndSyncSession
- (BOOL)hasError;
- (BOOL)hasRollback;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)rollback;
- (NSString)sessionID;
- (SYErrorInfo)error;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setHasRollback:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setRollback:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYEndSyncSession

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setRollback:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rollback = a3;
}

- (void)setHasRollback:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRollback
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYEndSyncSession;
  v4 = [(SYEndSyncSession *)&v8 description];
  v5 = [(SYEndSyncSession *)self dictionaryRepresentation];
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
  error = self->_error;
  if (error)
  {
    objc_super v8 = [(SYErrorInfo *)error dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"error"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithBool:self->_rollback];
    [v3 setObject:v9 forKey:@"rollback"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYEndSyncSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYEndSyncSession writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_sessionID) {
    -[SYEndSyncSession writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setHeader:self->_header];
  [v4 setSessionID:self->_sessionID];
  if (self->_error) {
    objc_msgSend(v4, "setError:");
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_rollback;
    v4[36] |= 1u;
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

  id v10 = [(SYErrorInfo *)self->_error copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_rollback;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:")) {
      goto LABEL_10;
    }
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1))
  {
    if (!-[SYErrorInfo isEqual:](error, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_rollback)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_sessionID hash];
  unint64_t v5 = [(SYErrorInfo *)self->_error hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_rollback;
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
    -[SYEndSyncSession setHeader:](self, "setHeader:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 3))
  {
    -[SYEndSyncSession setSessionID:](self, "setSessionID:");
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
    error = (SYErrorInfo *)-[SYEndSyncSession setError:](self, "setError:");
  }
  id v4 = v9;
LABEL_15:
  if (*((unsigned char *)v4 + 36))
  {
    self->_rollback = *((unsigned char *)v4 + 32);
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

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (SYErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)rollback
{
  return self->_rollback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYEndSyncSession writeTo:]", "SYEndSyncSession.m", 149, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYEndSyncSession writeTo:]", "SYEndSyncSession.m", 154, "nil != self->_sessionID");
}

@end