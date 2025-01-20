@interface SYFullSyncRequestAck
- (BOOL)accepted;
- (BOOL)hasError;
- (BOOL)hasInProgressSyncID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)inProgressSyncID;
- (NSString)requestSyncID;
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
- (void)setInProgressSyncID:(id)a3;
- (void)setRequestSyncID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYFullSyncRequestAck

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasInProgressSyncID
{
  return self->_inProgressSyncID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYFullSyncRequestAck;
  v4 = [(SYFullSyncRequestAck *)&v8 description];
  v5 = [(SYFullSyncRequestAck *)self dictionaryRepresentation];
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
  requestSyncID = self->_requestSyncID;
  if (requestSyncID) {
    [v3 setObject:requestSyncID forKey:@"requestSyncID"];
  }
  v7 = [NSNumber numberWithBool:self->_accepted];
  [v3 setObject:v7 forKey:@"accepted"];

  error = self->_error;
  if (error)
  {
    v9 = [(SYErrorInfo *)error dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"error"];
  }
  inProgressSyncID = self->_inProgressSyncID;
  if (inProgressSyncID) {
    [v3 setObject:inProgressSyncID forKey:@"inProgressSyncID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYFullSyncRequestAckReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYFullSyncRequestAck writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_requestSyncID) {
    -[SYFullSyncRequestAck writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_inProgressSyncID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setHeader:self->_header];
  [v5 setRequestSyncID:self->_requestSyncID];
  id v4 = v5;
  v5[40] = self->_accepted;
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
  if (self->_inProgressSyncID)
  {
    objc_msgSend(v5, "setInProgressSyncID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_requestSyncID copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  *(unsigned char *)(v5 + 40) = self->_accepted;
  id v10 = [(SYErrorInfo *)self->_error copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = [(NSString *)self->_inProgressSyncID copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:")) {
      goto LABEL_14;
    }
  }
  requestSyncID = self->_requestSyncID;
  if ((unint64_t)requestSyncID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](requestSyncID, "isEqual:")) {
      goto LABEL_14;
    }
  }
  if (self->_accepted)
  {
    if (!*((unsigned char *)v4 + 40)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_14:
    char v9 = 0;
    goto LABEL_15;
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1) && !-[SYErrorInfo isEqual:](error, "isEqual:")) {
    goto LABEL_14;
  }
  inProgressSyncID = self->_inProgressSyncID;
  if ((unint64_t)inProgressSyncID | *((void *)v4 + 3)) {
    char v9 = -[NSString isEqual:](inProgressSyncID, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_requestSyncID hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_accepted;
  unint64_t v6 = v4 ^ [(SYErrorInfo *)self->_error hash];
  return v6 ^ [(NSString *)self->_inProgressSyncID hash] ^ v5;
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
    -[SYFullSyncRequestAck setHeader:](self, "setHeader:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 4))
  {
    -[SYFullSyncRequestAck setRequestSyncID:](self, "setRequestSyncID:");
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
    error = (SYErrorInfo *)-[SYFullSyncRequestAck setError:](self, "setError:");
  }
  id v4 = v9;
LABEL_15:
  if (*((void *)v4 + 3))
  {
    error = (SYErrorInfo *)-[SYFullSyncRequestAck setInProgressSyncID:](self, "setInProgressSyncID:");
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

- (NSString)requestSyncID
{
  return self->_requestSyncID;
}

- (void)setRequestSyncID:(id)a3
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

- (NSString)inProgressSyncID
{
  return self->_inProgressSyncID;
}

- (void)setInProgressSyncID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSyncID, 0);
  objc_storeStrong((id *)&self->_inProgressSyncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYFullSyncRequestAck writeTo:]", "SYFullSyncRequestAck.m", 147, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYFullSyncRequestAck writeTo:]", "SYFullSyncRequestAck.m", 152, "nil != self->_requestSyncID");
}

@end